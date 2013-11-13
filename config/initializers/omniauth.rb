Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
           :scope => 'user_about_me,user_actions.news,user_birthday,user_events,user_groups,' + 
           'user_likes,user_questions,user_religion_politics,user_videos,' + 
           'user_actions.books,user_actions.video,user_checkins,user_friends,user_hometown,' + 
           'user_location,user_photo_video_tags,user_relationship_details,user_status,' + 
           'user_website,user_actions.music,user_activities,user_education_history,' +
           'user_games_activity,user_interests,user_notes,user_photos,user_relationships,' + 
           'user_subscriptions,user_work_history,friends_about_me,friends_actions.news,' + 
           'friends_birthday,friends_events,friends_hometown,friends_location,' + 
           'friends_photo_video_tags,friends_relationship_details,friends_status,' + 
           'friends_website,friends_actions.books,friends_actions.video,friends_checkins,' + 
           'friends_games_activity,friends_interests,friends_notes,friends_photos,' + 
           'friends_relationships,friends_subscriptions,friends_work_history,' + 
           'friends_actions.music,friends_activities,friends_education_history,friends_groups,' + 
           'friends_likes,friends_online_presence,friends_questions,friends_religion_politics,' + 
           'friends_videos,read_stream,email,read_friendlists,read_page_mailboxes,' +  
           'read_insights,read_requests'
end