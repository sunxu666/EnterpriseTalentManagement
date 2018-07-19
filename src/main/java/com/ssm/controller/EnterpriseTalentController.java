package com.ssm.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Department;
import com.ssm.entity.EnterpriseTalent;
import com.ssm.service.DepartmentService;
import com.ssm.service.EnterpriseTalentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

/**
 * 处理员工CRUD请求
 * @author
 */
@Controller
public class EnterpriseTalentController {
    @Autowired
    private EnterpriseTalentService enterpriseTalentService;
    /**
     * 查询员工数据（分页查询）用的逆向工程
     * @return
     */
    @RequestMapping(value = "/ETs")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){

        //这不是一个分页查询
        //引入PageHelper分页插件,在查询之前只需要调用，传入页码,以及每页的大小
        PageHelper.startPage(pn,3);
        //startPage后面紧跟的查询就是分页查询
        List<EnterpriseTalent> lists = enterpriseTalentService.getAll();
        //使用pageInfo包装查询后的结果,只需将pageInfo交给页面就行了
        //封装了详细的分页信息，包括我们查询出来的数据,传入连续显示的页数
        PageInfo page = new PageInfo(lists,5);
        model.addAttribute("pageInfo",page);
        return "list";
    }

    /**
     * 自己写的sql语句，进行查询功能
     * @param pn
     * @param model
     * @param departmentId
     * @return
     */
    @RequestMapping(value = "/ETs1")
    public String getEmps1(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model,
                           @RequestParam(name = "departmentId", required = false) Integer departmentId){

        //这不是一个分页查询
        //引入PageHelper分页插件,在查询之前只需要调用，传入页码,以及每页的大小
        PageHelper.startPage(pn,3);
        //startPage后面紧跟的查询就是分页查询
        List<EnterpriseTalent> lists = enterpriseTalentService.getAllWithDeptId(departmentId);
        //使用pageInfo包装查询后的结果,只需将pageInfo交给页面就行了
        //封装了详细的分页信息，包括我们查询出来的数据,传入连续显示的页数
        PageInfo page = new PageInfo(lists,5);
        model.addAttribute("pageInfo",page);
        model.addAttribute("deptId",departmentId);
        return "list1";
    }

    /**
     * 跳转添加页面
     * @return
     */
    @RequestMapping(value = "/add")
    public String add(){
        return "add";
    }

    /**
     * 保存功能
     * @param enterpriseTalent
     * @return
     */
    @RequestMapping(value = "/addContent")
    public String addContent(EnterpriseTalent enterpriseTalent){
        enterpriseTalentService.saveET(enterpriseTalent);
        return "redirect:/ETs";
    }

    /**
     * 修改跳转并显示
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/update")
    public String addContent(@RequestParam Integer id,Model model){
       EnterpriseTalent enterpriseTalent = enterpriseTalentService.getET(id);
        model.addAttribute("list",enterpriseTalent);
        return "update";
    }

    /**
     * 修改功能
     * @param enterpriseTalent
     * @return
     */
    @RequestMapping(value = "/updateContent",method = RequestMethod.POST)
    public String updateContent(EnterpriseTalent enterpriseTalent){
        enterpriseTalentService.updateContent(enterpriseTalent);
        return "redirect:/ETs1?departmentId="+enterpriseTalent.getDepartmentId();
    }

    /**
     * 删除并判断
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/delete")
    public String deleteContent(@RequestParam Integer id,Model model){

       int result = enterpriseTalentService.deleteContent(id);
       if(result>0){
           model.addAttribute("msg","删除成功！");
       } else{
           model.addAttribute("msg","删除失败！");
       }
        return "redirect:/ETs";
    }


}













