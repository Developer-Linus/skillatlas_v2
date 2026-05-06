# Learning Tracking Strategy

## Problem Statement

SkillAtlas computes missing skills by comparing a user's current skills against what the market demands for their target role. The challenge is tracking how a user is actually progressing toward closing those gaps over time.

Without tracking, the missing skills list is static. Users see what they lack but have no way to show progress, no motivation to keep going, and no signal that tells the system when a skill has been acquired.

---

## Core Strategy: Action Steps + CV Update as Proof of Completion

Each missing skill is given a short list of action steps. Users work through those steps while learning. When they are done, a notification prompts them to update their CV inside a built-in CV generator. The system scans the updated CV, detects the new skill, and automatically closes the gap. The role-fit score updates on its own.

This approach avoids heavy manual logging. The only deliberate action the user takes is updating their CV, which they need to do for job applications anyway. The CV generator makes this feel useful beyond the platform, not like admin work.

---

## Why Not Full Manual Tracking

Asking users to constantly tick boxes or log progress leads to low retention. Users stop updating after a few days because it feels like extra work on top of actual learning. The goal is to reduce friction while still getting accurate progress signals.

---

## Why Not Automatic Evidence Scraping Only

Asking users to upload CVs or connect GitHub profiles every time they learn something is still manual work. It creates the same friction problem just in a different form. The smarter approach is to let learning happen naturally, then prompt users at the right moment to update their CV once when a skill is ready to be locked in.

---

## The Two-Layer Tracking System

### Layer 1: Action Steps Track In-Progress Learning

Each missing skill has 3 to 5 ordered action steps. Users tick these off as they go. This makes progress visible while they are mid-learning and gives the system enough signal to know a user is actively working on a skill.

Action steps are not freeform. They follow a consistent structure:

- Step 1 is always a foundational learning activity (course, reading, tutorial)
- Middle steps involve applying the skill (project, exercise, build something)
- The final step is always "Open your CV in the platform, add this skill, and save"

The final step being the CV update is intentional. It connects active learning to official gap closure and creates a consistent habit loop across all skills.

### Layer 2: CV Update Marks a Skill as Acquired

When a user finishes learning a skill, they open their uploaded CV directly inside the platform, add the newly acquired skill, and save. The system re-scans the updated CV immediately. Any skills now present that were previously in the missing skills list get marked as acquired. The gap closes automatically. No re-uploading, no external tool, no manual confirmation needed.

The CV is uploaded once during onboarding and lives inside the platform from that point. Every update the user makes to it is the source of truth for their current skill set.

---

## The Notification System

Notifications are the bridge between learning and CV updating. They prompt users at moments when it makes the most sense to act.

**Trigger 1: Skill action steps completed**
When a user ticks off all action steps for a skill, they receive a notification:
"You have completed all steps for Cloud Platforms. Open your CV in the platform, add this skill, and save to lock it in and improve your role-fit score."

**Trigger 2: Periodic reminder**
Every 4 weeks, users receive a general nudge:
"It has been a while since you last updated your CV. Open it in the platform, add any new skills, and save to see how your role-fit score has changed."

**Trigger 3: New job match found**
When a new job match appears for the user's target role, they receive:
"A new job match was found. Open your CV, add any skills you have gained, and save to improve your fit score and increase your chances."

---

## The In-Platform CV Editor

During onboarding, the user uploads their CV once. From that point, the CV lives inside SkillAtlas. Users can open it at any time, edit it directly within the platform, and add new skills they have acquired.

This is the lowest-friction update possible. There is no re-uploading, no switching to an external tool, and no copy-pasting. The user just opens their CV, adds the skill, and saves. The system reads the change immediately and updates their skill profile.

Offering a free CV generator and editor within the platform gives users a reason to keep their CV up to date beyond skill tracking. They use it for job applications, portfolio updates, and career management. Every save is a fresh skill signal for the platform at no extra cost to the user.

---

## GitHub Integration (Optional)

Connecting GitHub is an optional way for users to surface skills they already have from real work they have done. It is not required. Users who do not have a GitHub account or choose not to connect one are not disadvantaged. The platform works fully without it.

### How It Works

The user connects their GitHub account once via OAuth from their profile settings. They authorise SkillAtlas to read their public repositories. No password is needed and no private repository is accessed unless the user explicitly grants that permission.

Once connected, the system scans their repositories for skill signals using the GitHub API:

- **Languages per repository** — Python, TypeScript, Go, Rust, etc.
- **Dependency files** — `package.json`, `requirements.txt`, `Cargo.toml`, `pom.xml`, and similar files reveal frameworks and libraries such as React, Django, Spring, and Docker
- **Repository topics** — tags the user has set on their repos such as "machine-learning", "rest-api", or "cloud"

These are mapped to skills in the SkillAtlas skill taxonomy.

### Suggested Skills, Not Auto-Added

The system never adds skills to a user's profile automatically. Instead it shows a confirmation screen:

"We found these skills in your GitHub repositories. Select the ones you want to add to your profile."

The user selects the skills that are accurate and confirms. Only the confirmed skills are added to their CV JSON. This keeps the profile honest. A repository from three years ago or a dependency the user did not write themselves should not be auto-credited.

### What It Feeds Into

Confirmed GitHub skills go into the same `skills` array in the CV JSON. The gap analysis re-runs immediately. Any missing skills now covered by the confirmed skills are closed and the role-fit score updates automatically. It feeds the same pipeline as a manual CV update, just with less effort from the user.

### Re-Scanning

After the initial connection, the user can trigger a re-scan at any time from their profile settings. This is useful after they have completed new projects and pushed them to GitHub. The system will suggest any newly detected skills for confirmation.

### Privacy

- Only public repositories are scanned by default
- The OAuth token is used only for reading repository metadata and dependency files, not for reading private code
- The user can disconnect GitHub at any time from their profile settings, which removes the token and disables future scans

---

## CV Storage: Structured JSON

The original CV file (PDF or DOCX) is never stored on the server. When a user uploads their CV during onboarding, the server parses it immediately, extracts all content into structured JSON, and discards the original file. Nothing large ever sits on the server.

**What the JSON stores:**

```json
{
  "personal": {
    "name": "Rosalyne Muchiri",
    "email": "rosalyne@gmail.com",
    "location": "Nairobi"
  },
  "skills": ["Pytest", "API Testing", "Postman"],
  "experience": [
    {
      "title": "QA Engineer",
      "company": "Acme Ltd",
      "duration": "2022 - 2024",
      "description": "Led testing efforts for the core product."
    }
  ],
  "education": [
    {
      "degree": "BSc Computer Science",
      "institution": "University of Nairobi",
      "year": "2021"
    }
  ]
}
```

This JSON record lives in the database as a single entry per user. No file system, no object storage, no binary files. A JSON record is a few kilobytes compared to a PDF which can be hundreds of kilobytes to several megabytes.

**Why this fits SkillAtlas specifically:**

- The `skills` array is what the gap analysis reads directly. No extra parsing step is needed when a user adds a new skill.
- Editing is field-by-field inside the UI. Users never deal with file uploads again after onboarding.
- The JSON is the single source of truth for the user's current skill set.

**How the upload flow works:**

```text
User uploads CV (PDF or DOCX)
         |
Server parses it and extracts structured JSON
         |
Original file is deleted immediately
         |
JSON is saved to the database
         |
Platform renders the CV from the JSON using a built-in template
         |
User edits fields directly in the UI
         |
On save, JSON updates and system re-scans the skills list
```

---

## CV Download: PDF Generated from JSON

When a user wants to download their CV, the server reads their JSON, passes it through a CV template, renders a PDF in memory, and streams it directly to the browser. The PDF is never written to disk or stored anywhere. It is generated on demand and discarded after the download completes.

This means:

- Storage cost stays at zero for downloads
- The user always downloads a clean, well-formatted CV
- The downloaded CV always reflects the latest saved state of their JSON
- Multiple CV templates can be offered without storing multiple files

**Download flow:**

```text
User clicks "Download CV"
         |
Server reads user's CV JSON from the database
         |
JSON is passed through a CV template
         |
PDF is rendered in memory
         |
PDF is streamed directly to the browser
         |
PDF is discarded from memory after download
```

---

## Action Step Rules

Action steps are not authored manually or stored as fixed templates. The intelligence layer generates them by first fetching real learning resources from the web relevant to the missing skill, then using AI to process those resources and build steps around them. Each step includes a direct link to the actual resource, not a generic instruction.

Rules that always apply:

- Each skill gets between 3 and 5 steps
- Steps are ordered. Each one builds on the previous
- Each step links to a real fetched resource (course, documentation page, article, video)
- All recommended resources must be free to access. No paid courses, no paywalled content, no trial-only platforms
- The final step is always "Open your CV in the platform, add this skill, and save" and is appended by the system after the AI output
- Steps are personalised per user based on their skill category, target role, and current level
- Generated steps are saved to the database after generation so they are not re-fetched and re-generated on every page load
- Steps are regenerated if the user's target role or level changes

**Preferred free resource sources the system fetches from:**

- YouTube (tutorials, crash courses, walkthroughs)
- Official documentation (docs.docker.com, developer.mozilla.org, docs.python.org, etc.)
- freeCodeCamp (articles and full courses)
- The Odin Project (web development)
- Khan Academy (foundational topics)
- Coursera and edX in audit mode (free to access without certificate)
- dev.to and Hashnode (community articles)
- GitHub repositories with learning content
- W3Schools and GeeksforGeeks

The AI is instructed to only include resources that are fully accessible without payment. If a resource is behind a paywall, it is excluded from the fetched results before the AI processes them.

**How the intelligence layer works:**

```text
Missing skill identified (e.g., "Docker", category: TECHNICAL_TOOL)
               |
System fetches relevant resources from the web
(Coursera, YouTube, official docs, dev.to, freeCodeCamp, etc.)
               |
AI receives the fetched resources and user context
(skill name, category, target role, user level)
               |
AI generates 3 to 4 steps built around those resources with links
               |
System appends the final CV update step
               |
Steps are saved to the database against the user's missing skill record
               |
Steps are displayed to the user
```

**Example output for "Docker" at beginner level targeting Software Architect:**

1. Watch this intro: [Docker in 100 Seconds](https://youtube.com/...) to understand what containers are and why they matter
2. Follow this hands-on guide: [Docker Getting Started](https://docs.docker.com/get-started/) to run your first container locally
3. Build a Dockerfile for one of your existing projects using this reference: [Dockerfile Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
4. Open your CV in the platform, add this skill, and save

---

## Skill Category Enum

Every skill in the system is tagged with one of the following categories. The category is passed to the AI intelligence layer as context so it knows what kind of resources to fetch and what kind of steps to generate. A technical tool skill fetches courses and documentation. A soft skill fetches guides and professional examples. The category shapes the AI output without constraining it to a fixed template.

```text
enum SkillCategory {
    TECHNICAL_TOOL,       // Docker, PostgreSQL, AWS, React, Figma
    METHODOLOGY_PROCESS,  // Agile, Scrum, CI/CD, TDD, DevOps
    DESIGN_ARCHITECTURE,  // Database Design, System Architecture, API Design
    SOFT_SKILL,           // Leadership, Communication, Problem Solving
    DOMAIN_KNOWLEDGE      // Cloud Computing, Machine Learning, Cybersecurity
}
```

This enum is the single source of truth for categorisation. Every skill stored in the system must have one of these values. No skill should exist without a category because the category is what drives the action steps shown to the user.

---

## Data Model

Each missing skill is a structured object, not just a label. When the backend is built in `models.jac`, this is the shape each missing skill should follow.

```text
MissingSkill
  name: string
  action_steps: [
    { order: int, title: string, done: bool },
    ...
  ]
  status: "not_started" | "in_progress" | "completed"
```

Status is derived automatically:

- "not_started": no steps completed
- "in_progress": at least one step completed, not all done
- "completed": all steps done and CV updated (gap officially closed)

---

## The Full Learning Loop

```text
System identifies missing skill for user's target role
              |
System generates action steps for that skill
              |
User works through action steps (ticks them off)
              |
Notification sent: "Update your CV to close this gap"
              |
User opens their CV in the platform, adds the skill, and saves
              |
System scans the updated CV and detects the newly acquired skill
              |
Gap closes automatically, role-fit score updates
              |
Next missing skill surfaced to the user
```

---

## What Gets Built (Implementation Order)

1. CV upload parser: extract JSON from PDF or DOCX on upload, discard the original file
2. `CVProfile` node in `models.jac` storing the structured JSON per user
3. In-platform CV editor: field-by-field UI backed by the JSON record
4. PDF generation on download: render JSON through a template in memory, stream to browser, discard
5. `MissingSkill` node in `models.jac` with `action_steps[]` and `status`
6. Predefined action steps per skill stored in the backend
7. A walker that computes `role_fit_score` by reading all missing skill statuses
8. A walker that accepts a step completion event and updates skill status
9. Notification triggers tied to step completion and periodic reminders
10. A walker that re-evaluates missing skills after a CV save and closes gaps
11. GitHub OAuth connection (optional): store token, scan public repos, suggest skills for user confirmation
12. A walker that maps GitHub-detected languages and dependencies to the SkillAtlas skill taxonomy
13. Re-scan trigger: allow users to manually re-scan GitHub from profile settings

---

## Summary

Missing skills need action steps so users know exactly what to do, not just what they lack. Progress is tracked through those steps. Official gap closure happens when the user updates their CV. Notifications connect the two. The CV generator removes friction from the update. This loop keeps the role-fit score accurate and gives users a clear, motivating path forward.
