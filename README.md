# Linux Administration and Shell Scripting

## Thought Process in Developing the `aws_cloud_manager.sh` Script

The development of the `aws_cloud_manager.sh` script was driven by the need to automate AWS IAM management for CloudOps Solutions' DevOps team. The primary objectives were:

- Extend an existing script to create **five IAM users**.
- Create an **admin group**.
- Attach the **AdministratorAccess** policy to the admin group.
- Assign the newly created users to the group using **AWS CLI commands**.

### 1. Understanding Requirements
- The script must be a **Bash shell script**.
- It must automate IAM tasks: user creation, group management, policy attachment, and user assignment.

### 2. Script Structure
- Started with the `#!/bin/bash` shebang to ensure Bash compatibility.
- Used a **modular approach** by organizing tasks into functions for readability and maintenance.
- Included **error handling** to capture the success or failure of AWS CLI commands.
- Added a **pre-check** for the `aws` command to ensure AWS CLI availability.

### 3. Development Steps
- **Define IAM User Names Array**:
  - Created an `IAM_USERS` array with five placeholder usernames (`user1`, `user2`, `user3`, `user4`, `user5`).
- **Create IAM Users**:
  - Used a `for` loop and `aws iam create-user` command inside a function.
  - Implemented error handling to verify if each user was created successfully.
- **Create IAM Group**:
  - Created a `create_iam_group` function using `aws iam create-group`.
- **Attach Administrative Policy**:
  - Developed an `attach_admin_policy` function to attach `AdministratorAccess` policy.
- **Assign Users to Group**:
  - Created an `assign_users_to_group` function to add all users into the `admin` group.
- **Execution**:
  - Called all functions in a sequence to automate the complete workflow.

The final script is **robust**, **error-tolerant**, **user-friendly**, and **easily maintainable**.

---

## Creating a Cloud Manager Script

### Step 1: Create a New Automation Script
Open your command line terminal and create a new shell script file.

 ![Create Script](https://github.com/user-attachments/assets/f91e52dc-d389-47b8-82d5-7b55f0ef2faa)

---

### Step 2: Enter the Script Code
Write the logic for creating users, creating a group, assigning users to the group, and attaching the admin policy.

![Enter Script](https://github.com/user-attachments/assets/21a0e28e-a269-40f9-9d84-e7907ef668bc)

---

### Step 3: Make the Script Executable and Run It
Change the permission of the script to make it executable and then run the script.

bash
chmod +x aws_cloud_manager.sh
./aws_cloud_manager.sh


### Step 4:   - Users were created

   - ![image](https://github.com/user-attachments/assets/43763bb8-8bf4-45c2-a7c0-0cd7c36d6b1a)
  - ![image](https://github.com/user-attachments/assets/738bd902-c0b3-46a4-804d-9f8760678b3b)


 ### Step 5: - Admin Group created and users are added to the admin group
   ![image](https://github.com/user-attachments/assets/d23e1fe2-cc6d-4b33-b698-27bd8b516a24)

- ![image](https://github.com/user-attachments/assets/8c86584f-1ac2-4537-ba26-cf30c121d367)

