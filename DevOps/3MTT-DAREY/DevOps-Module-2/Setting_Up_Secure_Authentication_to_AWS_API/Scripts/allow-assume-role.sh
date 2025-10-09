aws iam put-user-policy \
--user-name automation_user \
--policy-name AllowAssumeAutomationRole \
--policy-document file://allow-assume-role.json
