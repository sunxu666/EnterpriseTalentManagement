package com.ssm.service.impl;

import com.ssm.dao.EnterpriseTalentMapper;
import com.ssm.entity.EnterpriseTalent;
import com.ssm.entity.EnterpriseTalentExample;
import com.ssm.service.EnterpriseTalentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnterpriseTalentServiceImpl implements EnterpriseTalentService {

    @Autowired
    EnterpriseTalentMapper enterprisetalentMapper;

    @Override
    public List<EnterpriseTalent> getAll() {
        EnterpriseTalentExample example = new EnterpriseTalentExample();
        example.setOrderByClause("enterprisetalent.workingLife DESC");

        return enterprisetalentMapper.selectByExampleWithDept(null);

    }

    @Override
    public void saveET(EnterpriseTalent enterpriseTalent) {
        enterprisetalentMapper.insertSelective(enterpriseTalent);
    }

    @Override
    public EnterpriseTalent getET(Integer id) {
        EnterpriseTalent enterpriseTalent = enterprisetalentMapper.selectByPrimaryKeyWithDept(id);
        return enterpriseTalent;
    }

    @Override
    public void updateContent(EnterpriseTalent enterpriseTalent) {
        enterprisetalentMapper.updateByPrimaryKeySelective(enterpriseTalent);
    }

    @Override
    public List<EnterpriseTalent> getAllWithDeptId(Integer departmentId) {
        if (departmentId > 10) {
            return getAll();
        }
        return enterprisetalentMapper.selectWithDept(departmentId);


    }

    @Override
    public int deleteContent(Integer id) {

        return enterprisetalentMapper.deleteByPrimaryKey(id);
    }

}













