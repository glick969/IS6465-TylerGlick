1. When you submit the form you are directed to a page that displays that your request has been recieved, as well as confirmation of the form details. For example my page displays 'Request received' at the top, then details like the course I am requesting tutoring for, the specified request details, the topics, and form status.
2. header.php provides a consistent header to each page, similarly to how footer.php provides a consistent footer to each page. nav.php provides navigation links at the top of the page that direct you to either the request-form page or the requests page. require once is appropriate for these files instead just using require to ensure that the file is only loaded once, rather than loading every time it is called. This saves server resources. The css file is linked in header.php.
3. the purpose of reason is for the student to include the reason they are requesting tutoring and what they need help with. The purpose of topics[] is for the student to check which of the topics they would like to discuss in their tutoring session. The purpose of preferredtime is for the student to choose whether they want to schedule the tutoring session in the morning, afternoon, or evening. The purpose of preferreddate is for the student to select which date they want to schedule their tutoring session on. form_name is a hidden field and its purpose is to send information to the php layer and is used in process-request.php to check if the submission is valid. All of these values are of type 'string', except for topics[], which is an array of strings.
4. Test 1: Valid request
Values entered: Course IS 6465, preferred date 11/05/26, reason "help with upcoming exam.", topics "Exam review" and "Practice problems," preferred time Afternoon.
Result: The request was accepted.
Message displayed: "Request received," followed by the course, request details, topics, and "Status: Pending review."
Business rule checked: A request is accepted only when the course and time are on the allowed lists, the reason is 10 to 500 characters long, at least one valid topic is chosen, the date is today or later, and the form name is correct.
Test 2: Missing or invalid value
Values entered: Course IS 6495, preferred date 11/05/26, reason "Help", topic "Study plan," preferred time Morning.
Result: The request was rejected.
Message displayed: "Request could not be submitted," with the error "Describe your request using 10 to 500 characters."
Business rule checked: The reason must contain between 10 and 500 characters after extra spaces are trimmed. The browser allowed the short value because the textarea has required but no minimum length, which shows that the server-side check catches what the browser does not.
Test 3: Past date
Values entered: Course IS 6570, preferred date 10/15/26, reason "help with upcoming exam.", topic "Exam review," preferred time Evening.
Result: The request was rejected.
Message displayed: "Request could not be submitted," with the error "Preferred date cannot be in the past."
Business rule checked: A tutoring session cannot be scheduled for a date before today. The date input has no min attribute, so only the server enforces this rule.

5. When opening validation-tests.php, the results are:" 
Valid time: PASS

Missing time: PASS

Altered value: PASS

Multiple valid topics: PASS

Missing topics: PASS

Altered topic: PASS

Minimum length: PASS

Maximum length: PASS

Too short: PASS

Too long: PASS".

The request-form.php page represents the create action. The request-details.php page represents the read one request action. The requests.php page represents the read all requests action. The edit-requests.php page represents the update action. The delete-requests.php page represents the delete action. the query parameter that appears in the request details url is request_id=12. The GET query parameter for viewing one request is appropriate because viewing a request only reads data and does not change anything on the server. Update and delete should use POST rather than get because they require data to be changed or updated on the server. this should use POST because it is more secure and does not display data in the url.


