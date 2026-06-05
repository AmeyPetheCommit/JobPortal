package com.dao;

import com.model.JInfo;

public interface JobSeekerDao {

    // Fetch job seeker profile details using jskId
    JInfo getJobSeekerInfoById(int jskId);

	boolean updateJobSeekerInfo(JInfo jinfo);
}