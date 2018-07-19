package com.ssm.dao;

import com.ssm.entity.EnterpriseTalent;
import com.ssm.entity.EnterpriseTalentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EnterpriseTalentMapper {
    long countByExample(EnterpriseTalentExample example);

    int deleteByExample(EnterpriseTalentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(EnterpriseTalent record);

    int insertSelective(EnterpriseTalent record);

    List<EnterpriseTalent> selectByExample(EnterpriseTalentExample example);

    EnterpriseTalent selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") EnterpriseTalent record, @Param("example") EnterpriseTalentExample example);

    int updateByExample(@Param("record") EnterpriseTalent record, @Param("example") EnterpriseTalentExample example);

    int updateByPrimaryKeySelective(EnterpriseTalent record);

    int updateByPrimaryKey(EnterpriseTalent record);

    /**
     * 根据条件查询所有成员和部门
     * @param example
     * @return
     */
    List<EnterpriseTalent> selectByExampleWithDept(EnterpriseTalentExample example);
    /**
     * 根据empId查询所有成员和部门
     * @param id
     * @return
     */
    EnterpriseTalent selectByPrimaryKeyWithDept(Integer id);

    /**
     * 根据条件查询
     * @param departmentId
     * @return
     */
    List<EnterpriseTalent> selectWithDept(@Param(value = "departmentId")Integer departmentId);
}