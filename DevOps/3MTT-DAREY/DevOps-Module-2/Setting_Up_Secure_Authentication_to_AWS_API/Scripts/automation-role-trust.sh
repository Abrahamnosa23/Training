# create the role with the trust policy
aws iam create-role \
--role-name automation_role \
--assume-role-policy-document file://automation-role-trust.json


# attach the custom policy created earlier to the role
aws iam attach-role-policy \
--role-name automation_role \
--policy-arn arn:aws:iam::ACCOUNT_ID:policy/AutomationEC2S3FullAccess
