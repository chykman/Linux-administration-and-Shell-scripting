#!/bin/bash

# aws_cloud_manager.sh - Extended script for AWS IAM management

# 1. Define IAM User Names Array
IAM_USERS=("user1" "user2" "user3" "user4" "user5")

# 2. Create IAM Users
echo "Creating IAM users..."
for USER in "${IAM_USERS[@]}"; do
    aws iam create-user --user-name "$USER"
    if [ $? -eq 0 ]; then
        echo "Successfully created user: $USER"
    else
        echo "Failed to create user: $USER"
    fi
done

# 3. Create IAM Group
create_iam_group() {
    echo "Creating IAM group 'admin'..."
    aws iam create-group --group-name admin
    if [ $? -eq 0 ]; then
        echo "Successfully created group: admin"
    else
        echo "Failed to create group: admin"
    fi
}

# 4. Attach Administrative Policy to Group
attach_admin_policy() {
    echo "Attaching AdministratorAccess policy to 'admin' group..."
    aws iam attach-group-policy --group-name admin --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
    if [ $? -eq 0 ]; then
        echo "Successfully attached AdministratorAccess policy to group: admin"
    else
        echo "Failed to attach policy to group: admin"
    fi
}

# 5. Assign Users to Group
assign_users_to_group() {
    echo "Assigning users to 'admin' group..."
    for USER in "${IAM_USERS[@]}"; do
        aws iam add-user-to-group --user-name "$USER" --group-name admin
        if [ $? -eq 0 ]; then
            echo "Successfully added $USER to admin group"
        else
            echo "Failed to add $USER to admin group"
        fi
    done
}

# Execute the functions
create_iam_group
attach_admin_policy
assign_users_to_group

echo "IAM management process completed."
