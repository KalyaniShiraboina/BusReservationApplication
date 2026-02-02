package com.demo.service;

import java.util.List;

import com.demo.model.Feedback;

public interface FeedbackService {
    Feedback saveFeedback(Feedback feedback);
    List<Feedback> getAllFeedbacks();
}

