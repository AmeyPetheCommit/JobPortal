package com.dao;

import com.model.CInfo;
import com.model.Company;

public interface CompanyDao {


	Company getCompanyProfileById(Integer companyId);

	boolean updateCompanyInfo(CInfo cinfo);

}
