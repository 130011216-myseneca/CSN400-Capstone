\
**COURSE INFORMATION: CSN400-NCC**<br />
**STUDENT’S NAME: Austin MacKenzie**<br />
**STUDENT'S NUMBER: 130011216**<br />
**GITHUB USER ID: 130011216-myseneca**<br />
**TEACHER’S NAME: Atoosa Nasiri**<br />
<br />
________________________________________________________________
# Table of Contents
- [PART A - Adding Files - Local Repo Workflow](#part-a---adding-files---local-repo-workflow)
- [PART B - Inspecting Local Repo with 'git status' and 'git log'](#part-b---creating-local-repo-with-git-status-and-git-log-how-do-these-two-commands-differ-elaborate-with-an-example)
- [PART C - Creating & Merging Branches](#part-c---creating-and-merging-branches-run-git-log--n-5-embed-the-log-output-as-bash-script-to-the-readmemd-with-proper-formatting)
- [PART D - Git Branching Strategy Review Questions](#part-d---git-branching-strategy-review-question)
<br />

<br />

### ***PART A - Adding Files - Local Repo Workflow:***
\
C:\Users\austi\Desktop\   \Semester 4\CSN400NCC\Github\CSN400-Capstone\Checkpoint2 


<br />

### ***PART B - Creating Local Repo with 'git status' and 'git log': How do these two commands differ? Elaborate with an example.***

<br />Git Status shows the staging area and status of the repository.
<br />Git Log shows this history of commits. 

<br />

### ***PART C - Creating and merging branches: Run 'git log -n 5'. Embed the log output as bash script to the 'README.md' with proper formatting.***
<br /> git log -n 5 >> README.md

<br />

### ***PART D - Git Branching Strategy Review Question:***


### ****QUESTIONS**** 

<br />

***1. What are the differences between develop branch and main branch?***

The main branch is the default branch where everything that happens, eventually get's merged into. The development branch is where changes are made and will eventually be merged into the main branch.  It also allows an easier workflow for multiple users.

\
***2. What are the three supporting branches?***

The three branches are:
Features/Bugfix- Used for development of new features/Used to fix bugs and merges back into development.
Hotfix-Changes that have to happen immediately, branches from main branch.
Release-Used for release updates and last minute changes.

\
***3. What is the best practices working with release branches?***

There should be more then one developer and be 'publicly available'. This allows a smaller room for error.commit 

\
\
\
\
\
4da334b0e656704871e7592f7c00a0531348eadc
Author: 130011216-myseneca <122462473+130011216-myseneca@users.noreply.github.com>
Date:   Tue Jan 24 20:35:39 2023 -0500

    adds proper links to README

commit 3c566c32b249441bfb699a4484ec01336ce5c410
Author: 130011216-myseneca <122462473+130011216-myseneca@users.noreply.github.com>
Date:   Tue Jan 24 20:27:29 2023 -0500

    adds proper links to README

commit 86f982535b531163264875d01f68ee9e01ebf9c9
Author: 130011216-myseneca <122462473+130011216-myseneca@users.noreply.github.com>
Date:   Tue Jan 24 20:16:09 2023 -0500

    adds logs to README

commit 707e2b27c2e552afa93bfa758d3229fe68288af0
Author: 130011216-myseneca <122462473+130011216-myseneca@users.noreply.github.com>
Date:   Tue Jan 24 19:55:38 2023 -0500

    adds editing changes

commit d4884fd1adaaca8334ae39db4e45542cf4caebf8
Author: 130011216-myseneca <122462473+130011216-myseneca@users.noreply.github.com>
Date:   Tue Jan 24 19:51:27 2023 -0500

    adds editing changes
