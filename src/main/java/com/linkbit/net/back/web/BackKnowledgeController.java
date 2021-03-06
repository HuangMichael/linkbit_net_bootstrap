package com.linkbit.net.back.web;

import com.linkbit.net.back.domain.HeaderDTO;
import com.linkbit.net.back.utils.SessionUtil;
import com.linkbit.net.front.domain.knowledge.Knowledge;
import com.linkbit.net.front.domain.knowledge.KnowledgeRepository;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by huangbin on 2016/1/18 0018.
 * 后台 知识库信息控制器
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/knowledge")
@SessionAttributes({"backMenusList","headerDTO"})
public class BackKnowledgeController {

    @Autowired
    MenuRepository menuRepository;
    @Autowired
    KnowledgeRepository knowledgeRepository;

    @RequestMapping("/index")
    public String index(ModelMap modelMap) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        List<Knowledge> knowledgeList = knowledgeRepository.findAll();

        HeaderDTO headerDTO = new HeaderDTO();
        headerDTO.setSystemName("网站后台管理系统");
        headerDTO.setAppName("知识信息");
        modelMap.put("headerDTO", headerDTO);
        modelMap.put("backMenusList", backMenusList);
        modelMap.put("knowledgeList", knowledgeList);
        return "/back/knowledge/index";
    }


    @RequestMapping("/detail/{id}")
    public ModelAndView detail(@PathVariable("id") Long id) {
        Knowledge knowledge = knowledgeRepository.findById(id);
        Map<String, Knowledge> map = new HashMap<String, Knowledge>();
        map.put("knowledge", knowledge);
        ModelAndView mv = new ModelAndView("/back/knowledge/detail", map);
        return mv;
    }



    @RequestMapping(value = "/create",method = RequestMethod.GET)
    public ModelAndView create(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("/back/knowledge/create");
        Knowledge knowledge =  new Knowledge();
        knowledge.setPublishTime(new Date());
        knowledge.setPublisher(SessionUtil.getCurrentUser(request).getUserName());
        mv.addObject("knowledge",knowledge);
        return mv;
    }


    @RequestMapping("/edit/{id}")
    public ModelAndView edit(@PathVariable("id") Long id) {
        Knowledge knowledge = knowledgeRepository.findById(id);
        Map<String, Knowledge> map = new HashMap<String, Knowledge>();
        map.put("knowledge", knowledge);
        ModelAndView mv = new ModelAndView("/back/knowledge/edit", map);
        return mv;
    }


    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public void delete(@PathVariable long id) {
        Knowledge knowledge = knowledgeRepository.findById(id);
        knowledgeRepository.delete(knowledge);

    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@ModelAttribute("knowledge") Knowledge knowledge, @RequestParam("objId")Long objId) {
        System.out.println("objId---------------------"+objId);
        if (objId != null) {
            Knowledge oldObj = knowledgeRepository.findById(objId);
            oldObj.setTitle(knowledge.getTitle());
            oldObj.setContent(knowledge.getContent());
            oldObj.setDisplay(knowledge.getDisplay());
            oldObj.setKeywords(knowledge.getKeywords());
            oldObj.setKnowledgeDesc(knowledge.getKnowledgeDesc());
            oldObj.setPublisher("xxx");
            oldObj.setPublishTime(new Date());
            knowledgeRepository.save(oldObj);
        }
        return "forward:/back/knowledge/index";
    }


    /**
     * 保存知识信息
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Knowledge save(@ModelAttribute  Knowledge knowledge) {
        System.out.println(knowledge.toString());
        knowledgeRepository.save(knowledge);
        return knowledge;
    }

   /* @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String handleFileUpload(@RequestParam("productId") long productId, @RequestParam("fileName") String fileName, @RequestParam("file") MultipartFile file, HttpServletRequest request) {
        String contextPath = SessionUtil.getContextPath(request);
        String realPath = "F:/dev/linkbit/src/main/webapp";
        String absolutePath = "/front/images/product/";
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                FileOutputStream fileOutputStream = new FileOutputStream(new File(realPath+absolutePath + fileName));
                BufferedOutputStream stream = new BufferedOutputStream(fileOutputStream);
                stream.write(bytes);
                stream.close();
                Knowledge knowledge = knowledgeRepository.findById(productId);
                knowledge.set
                knowledgeRepository.save(product);
                return "forward:/back/product/detail/"+productId;
            } catch (Exception e) {
                return "上传失败" + e.getMessage();
            }
        } else {
            return "上传失败，文件不能为空";
        }
    }*/

}
