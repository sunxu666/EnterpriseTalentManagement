package com.ssm.service;

import com.ssm.entity.EnterpriseTalent;

import java.util.List;

public interface EnterpriseTalentService {
   List<EnterpriseTalent> getAll();

   void saveET(EnterpriseTalent enterpriseTalent);

    EnterpriseTalent getET(Integer id);

   void updateContent(EnterpriseTalent enterpriseTalent);

    List<EnterpriseTalent> getAllWithDeptId(Integer departmentId);

    int deleteContent(Integer id);
/*  boolean checkUse(String empName);


    void deleteBatch(List<Integer> del_ids);*/
}
