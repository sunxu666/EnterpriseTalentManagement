package com.ssm.entity;

import java.io.Serializable;

/**
 * enterprisetalent
 * @author 
 */
public class EnterpriseTalent implements Serializable {
    /**
     * 人才编号
     */
    private Integer id;

    /**
     * 人才姓名
     */
    private String name;

    /**
     * 工作年限
     */
    private Integer workingLife;

    /**
     * 工作经历
     */
    private String workExperience;

    /**
     * 个人简介
     */
    private String personalProfile;

    /**
     * 所属部门
     */
    private Integer departmentId;

    /**
     * 毕业学校
     */
    private String graduateSchool;
    /**
     * 部门信息
     */
    private Department department;

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getWorkingLife() {
        return workingLife;
    }

    public void setWorkingLife(Integer workingLife) {
        this.workingLife = workingLife;
    }

    public String getWorkExperience() {
        return workExperience;
    }

    public void setWorkExperience(String workExperience) {
        this.workExperience = workExperience;
    }

    public String getPersonalProfile() {
        return personalProfile;
    }

    public void setPersonalProfile(String personalProfile) {
        this.personalProfile = personalProfile;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public String getGraduateSchool() {
        return graduateSchool;
    }

    public void setGraduateSchool(String graduateSchool) {
        this.graduateSchool = graduateSchool;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        EnterpriseTalent other = (EnterpriseTalent) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
            && (this.getWorkingLife() == null ? other.getWorkingLife() == null : this.getWorkingLife().equals(other.getWorkingLife()))
            && (this.getWorkExperience() == null ? other.getWorkExperience() == null : this.getWorkExperience().equals(other.getWorkExperience()))
            && (this.getPersonalProfile() == null ? other.getPersonalProfile() == null : this.getPersonalProfile().equals(other.getPersonalProfile()))
            && (this.getDepartmentId() == null ? other.getDepartmentId() == null : this.getDepartmentId().equals(other.getDepartmentId()))
            && (this.getGraduateSchool() == null ? other.getGraduateSchool() == null : this.getGraduateSchool().equals(other.getGraduateSchool()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        result = prime * result + ((getWorkingLife() == null) ? 0 : getWorkingLife().hashCode());
        result = prime * result + ((getWorkExperience() == null) ? 0 : getWorkExperience().hashCode());
        result = prime * result + ((getPersonalProfile() == null) ? 0 : getPersonalProfile().hashCode());
        result = prime * result + ((getDepartmentId() == null) ? 0 : getDepartmentId().hashCode());
        result = prime * result + ((getGraduateSchool() == null) ? 0 : getGraduateSchool().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", workingLife=").append(workingLife);
        sb.append(", workExperience=").append(workExperience);
        sb.append(", personalProfile=").append(personalProfile);
        sb.append(", departmentId=").append(departmentId);
        sb.append(", graduateSchool=").append(graduateSchool);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}