import from "@jac/runtime" { useNavigate }
import from "..components/BrandLogo" { BrandLogo }
import from "lucide-react" {
    Bell,
    LogOut,
    Settings,
    LayoutDashboard,
    Zap,
    Map,
    Briefcase,
    FileText,
    ChevronRight,
    Check,
    X,
    Menu
}

glob NOTIFICATIONS: list = [
         {
             "text": "New job match: Senior Software Architect at WhatJobs",
             "time": "2 hours ago",
             "color": "bg-[#2dd4bf]"
         },
         {
             "text": "Phase 1 resource unlocked — start learning now!",
             "time": "Yesterday",
             "color": "bg-[#fbbf24]"
         },
         {
             "text": "Your role fit score improved by 8% this week",
             "time": "3 days ago",
             "color": "bg-[#2dd4bf]"
         },

     ],
     ROADMAP_PHASES: list = [
         {
             "phase": 1,
             "title": "Foundational Skills",
             "duration": "2 months",
             "tags": ["programming", "database design"],
             "status": "Start Phase →",
             "locked": False
         },
         {
             "phase": 2,
             "title": "Agile and Leadership",
             "duration": "1 month",
             "tags": ["agile", "leadership"],
             "status": "Locked — complete Phase 1 first",
             "locked": True
         },
         {
             "phase": 3,
             "title": "Software Architecture",
             "duration": "2 months",
             "tags": ["architecture"],
             "status": "Locked",
             "locked": True
         },

     ],
     JOBS: list = [
         {
             "title": "Senior Software Architect",
             "company": "WhatJobs Direct",
             "location": "Nyeri"
         },
         {"title": "Software Architect", "company": "Crossover", "location": "Nairobi"},
         {
             "title": "Lead Software Architect",
             "company": "WhatJobs Direct",
             "location": "Embu"
         },

     ],
     MATCHED_SKILLS: list = ["Pytest", "API testing", "Postman"],
     MISSING_SKILLS: list = ["database design", "agile methods", "cloud platforms"];

def:pub SidebarContent(navigate: any, onClose: any = None) -> JsxElement {
    return
        <div className="flex flex-col flex-1">
            <div className="p-6 border-b border-white/10">
                <BrandLogo/>
                <p className="text-xs text-white/50 mt-1">
                    Career Intelligence
                </p>
            </div>
            <div className="px-5 py-4 border-b border-white/10">
                <p className="text-[10px] uppercase tracking-wider text-white/40 mb-1">
                    Account
                </p>
                <p className="text-sm font-medium text-white/90">
                    rosalyne@gmail.com
                </p>
                <p className="text-xs text-[#2dd4bf]">
                    Target: Software Architect
                </p>
            </div>
            <nav className="flex-1 px-4 py-5 space-y-1">
                <p
                    className="text-[10px] uppercase tracking-wider text-white/40 px-3 mb-2"
                >
                    Main
                </p>
                <button
                    onClick={onClose}
                    className="w-full flex items-center gap-3 px-4 py-3 rounded-lg text-sm transition-colors bg-white/10 text-[#2dd4bf] font-semibold"
                >
                    <span className="w-2 h-2 rounded-full bg-[#2dd4bf]"/>
                    <LayoutDashboard size={18}/>
                    Dashboard
                </button>
                <button
                    onClick={onClose}
                    className="w-full flex items-center gap-3 px-4 py-3 rounded-lg text-sm transition-colors text-white/60 hover:text-white hover:bg-white/5"
                >
                    <Zap size={18}/>
                    My Skills
                </button>
                <button
                    onClick={onClose}
                    className="w-full flex items-center gap-3 px-4 py-3 rounded-lg text-sm transition-colors text-white/60 hover:text-white hover:bg-white/5"
                >
                    <Map size={18}/>
                    Learning Roadmap
                </button>
                <button
                    onClick={onClose}
                    className="w-full flex items-center gap-3 px-4 py-3 rounded-lg text-sm transition-colors text-white/60 hover:text-white hover:bg-white/5"
                >
                    <Briefcase size={18}/>
                    Job Opportunities
                </button>
                <p
                    className="text-[10px] uppercase tracking-wider text-white/40 px-3 mt-6 mb-2"
                >
                    Account
                </p>
                <button
                    onClick={onClose}
                    className="w-full flex items-center gap-3 px-4 py-3 rounded-lg text-sm text-white/60 hover:text-white hover:bg-white/5 transition-colors"
                >
                    <span className="w-2 h-2 rounded-full bg-[#fbbf24]"/>
                    <FileText size={18}/>
                    Resume Summary
                </button>
                <button
                    onClick={onClose}
                    className="w-full flex items-center gap-3 px-4 py-3 rounded-lg text-sm text-white/60 hover:text-white hover:bg-white/5 transition-colors"
                >
                    <span className="w-2 h-2 rounded-full bg-[#fbbf24]"/>
                    <Settings size={18}/>
                    Settings
                </button>
            </nav>
            <div className="p-5 border-t border-white/10">
                <button
                    onClick={lambda -> None { if onClose {
                        onClose();
                    }navigate("/");}}
                    className="w-full flex items-center justify-center gap-2 py-3 rounded-lg bg-white/5 hover:bg-white/10 text-white/70 hover:text-white text-sm transition-colors"
                >
                    <LogOut size={16}/>
                    Logout →
                </button>
            </div>
        </div>;
}

def:pub DashboardPage -> JsxElement {
    navigate: any = useNavigate();
    has notifVisible: bool = True,
        mobileMenuOpen: bool = False;

    return
        <div className="flex min-h-screen bg-[#f8fffe]">
            <aside
                className="hidden lg:flex flex-col w-[300px] xl:w-[320px] bg-[#0f2027] text-white min-h-screen sticky top-0 shrink-0"
            >
                <SidebarContent navigate={navigate}/>
            </aside>
            {mobileMenuOpen
            and <div className="fixed inset-0 z-50 lg:hidden">
                <div
                    className="absolute inset-0 bg-black/50"
                    onClick={lambda -> None { mobileMenuOpen = False;}}
                />
                <aside
                    className="relative w-[280px] sm:w-[300px] bg-[#0f2027] text-white h-full flex flex-col overflow-y-auto"
                >
                    <SidebarContent
                        navigate={navigate}
                        onClose={lambda -> None { mobileMenuOpen = False;}}
                    />
                </aside>
            </div>}
            <div className="flex-1 flex flex-col min-w-0">
                <header
                    className="sticky top-0 z-40 bg-white border-b border-gray-200 px-4 sm:px-6 py-3 flex items-center justify-between"
                >
                    <div className="flex items-center gap-3">
                        <button
                            className="lg:hidden p-2 rounded-lg hover:bg-gray-100 transition-colors"
                            onClick={lambda -> None { mobileMenuOpen = True;}}
                        >
                            <Menu size={22} className="text-[#0f2027]"/>
                        </button>
                        <h2
                            className="text-base sm:text-lg font-semibold text-[#0f2027]"
                        >
                            Good morning, Rosalyne 👋
                        </h2>
                    </div>
                    <div className="flex items-center gap-3 sm:gap-4">
                        <button
                            className="relative p-2 rounded-full hover:bg-gray-100 transition-colors"
                        >
                            <Bell size={20} className="text-[#0f2027]"/>
                            <span
                                className="absolute top-1.5 right-1.5 w-2.5 h-2.5 bg-[#fbbf24] rounded-full border-2 border-white"
                            />
                        </button>
                        <div
                            className="w-9 h-9 rounded-full bg-[#0f2027] flex items-center justify-center text-white text-xs font-bold"
                        >
                            RM
                        </div>
                    </div>
                </header>
                <main
                    className="flex-1 p-4 sm:p-6 lg:p-8 max-w-6xl mx-auto w-full space-y-5 sm:space-y-6"
                >
                    <div>
                        <h1
                            className="text-xl sm:text-2xl lg:text-3xl font-bold text-[#0f2027] font-display"
                        >
                            Your Career
                            <span className="text-[#2dd4bf]">
                                Intelligence
                            </span>
                            Dashboard
                        </h1>
                        <p className="text-sm text-gray-500">
                            Here's a snapshot of your progress toward Software Architect
                        </p>
                    </div>
                    {notifVisible
                    and <div
                        className="rounded-xl border border-gray-200 bg-white p-4 sm:p-5"
                    >
                        <div className="flex items-center justify-between mb-4">
                            <h3 className="font-bold text-[#0f2027]">
                                Notifications
                            </h3>
                            <button
                                className="text-xs text-[#2dd4bf] hover:underline font-medium"
                            >
                                Mark all read
                            </button>
                        </div>
                        <div className="space-y-3">
                            {[
                                <div
                                    key={n["text"]}
                                    className="flex items-center gap-3 py-2 border-b border-gray-100 last:border-0"
                                >
                                    <span
                                        className={f"w-2.5 h-2.5 rounded-full {n[
                                            'color'
                                        ]} shrink-0"}
                                    />
                                    <div className="flex-1 min-w-0">
                                        <p
                                            className="text-sm text-[#0f2027] truncate sm:whitespace-normal"
                                        >
                                            {n["text"]}
                                        </p>
                                        <p className="text-xs text-gray-400">
                                            {n["time"]}
                                        </p>
                                    </div>
                                    <span
                                        className={f"w-2 h-2 rounded-full {n[
                                            'color'
                                        ]} shrink-0"}
                                    />
                                </div> for n in NOTIFICATIONS
                            ]}
                        </div>
                    </div>}
                    <div className="grid grid-cols-1 sm:grid-cols-3 gap-3 sm:gap-4">
                        <div
                            className="rounded-xl border border-[#2dd4bf]/20 bg-[#f0fdfa] p-4 sm:p-5"
                        >
                            <div className="flex items-center justify-between mb-3">
                                <p
                                    className="text-xs font-bold uppercase tracking-wider text-[#0f2027]"
                                >
                                    Matched
                                    <br/>
                                    Skills
                                </p>
                                <span className="w-3 h-3 rounded-full bg-[#2dd4bf]"/>
                            </div>
                            <p className="text-3xl sm:text-4xl font-bold text-[#2dd4bf]">
                                5
                            </p>
                            <p className="text-xs text-gray-500 mt-1">
                                of 46 total skills matched
                            </p>
                        </div>
                        <div
                            className="rounded-xl border border-[#fbbf24]/20 bg-[#fffbeb] p-4 sm:p-5"
                        >
                            <div className="flex items-center justify-between mb-3">
                                <p
                                    className="text-xs font-bold uppercase tracking-wider text-[#0f2027]"
                                >
                                    Role Fit
                                    <br/>
                                    Score
                                </p>
                                <span className="w-3 h-3 rounded-full bg-[#fbbf24]"/>
                            </div>
                            <p className="text-3xl sm:text-4xl font-bold text-[#fbbf24]">
                                42%
                            </p>
                            <p className="text-xs text-gray-500 mt-1">
                                toward Software Architect
                            </p>
                        </div>
                        <div
                            className="rounded-xl border border-red-200 bg-red-50 p-4 sm:p-5"
                        >
                            <div className="flex items-center justify-between mb-3">
                                <p
                                    className="text-xs font-bold uppercase tracking-wider text-[#0f2027]"
                                >
                                    Missing
                                    <br/>
                                    Skills
                                </p>
                                <span className="w-3 h-3 rounded-full bg-red-400"/>
                            </div>
                            <p className="text-3xl sm:text-4xl font-bold text-red-400">
                                10
                            </p>
                            <p className="text-xs text-gray-500 mt-1">
                                skills to close the gap
                            </p>
                        </div>
                    </div>
                    <div className="rounded-xl bg-[#0f2027] p-4 sm:p-6 text-white">
                        <p
                            className="text-xs font-bold uppercase tracking-wider text-[#fbbf24] mb-1"
                        >
                            Overall Progress
                        </p>
                        <div
                            className="flex flex-col sm:flex-row sm:items-end sm:justify-between mb-1 gap-2"
                        >
                            <div>
                                <h3 className="text-base sm:text-lg font-bold">
                                    Software Architect Readiness
                                </h3>
                                <p className="text-sm text-white/60">
                                    Keep going — you're almost halfway there!
                                </p>
                            </div>
                            <p
                                className="text-3xl sm:text-4xl font-bold text-[#fbbf24]"
                            >
                                42%
                            </p>
                        </div>
                        <div
                            className="mt-3 h-3 rounded-full bg-white/10 overflow-hidden"
                        >
                            <div
                                className="h-full rounded-full bg-gradient-to-r from-[#2dd4bf] to-[#fbbf24]"
                                style={{"width": "42%"}}
                            />
                        </div>
                    </div>
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-5 sm:gap-6">
                        <div
                            className="rounded-xl border border-gray-200 bg-white p-4 sm:p-5"
                        >
                            <div className="flex items-center justify-between mb-5">
                                <h3 className="font-bold text-[#0f2027]">
                                    Learning Roadmap
                                </h3>
                                <button
                                    className="text-xs text-[#2dd4bf] hover:underline font-medium"
                                >
                                    View all →
                                </button>
                            </div>
                            <div className="space-y-5">
                                {[
                                    <div key={phase["phase"]} className="flex gap-3">
                                        <div
                                            className={f"w-8 h-8 rounded-full flex items-center justify-center text-xs font-bold shrink-0 {'bg-gray-100 text-gray-400'
                                                if phase['locked']
                                                else 'bg-[#2dd4bf]/15 text-[#2dd4bf]'}"}
                                        >
                                            {phase["phase"]}
                                        </div>
                                        <div className="flex-1 min-w-0">
                                            <p
                                                className="font-semibold text-sm text-[#0f2027]"
                                            >
                                                {phase["title"]}
                                            </p>
                                            <p className="text-xs text-gray-400">
                                                {phase["duration"]}
                                            </p>
                                            <div
                                                className="flex flex-wrap gap-1.5 mt-1.5"
                                            >
                                                {[
                                                    <span
                                                        key={tag}
                                                        className="text-[10px] px-2 py-0.5 rounded-full border border-gray-200 text-gray-500"
                                                    >
                                                        {tag}
                                                    </span> for tag in phase["tags"]
                                                ]}
                                            </div>
                                            <p
                                                className={f"text-xs mt-2 {'text-gray-400'
                                                    if phase['locked']
                                                    else 'text-[#2dd4bf] font-medium cursor-pointer hover:underline'}"}
                                            >
                                                {phase["status"]}
                                            </p>
                                        </div>
                                    </div> for phase in ROADMAP_PHASES
                                ]}
                            </div>
                        </div>
                        <div className="space-y-5 sm:space-y-6">
                            <div
                                className="rounded-xl border border-gray-200 bg-white p-4 sm:p-5"
                            >
                                <div className="flex items-center justify-between mb-4">
                                    <h3 className="font-bold text-[#0f2027]">
                                        Job Opportunities
                                    </h3>
                                    <button
                                        className="text-xs text-[#2dd4bf] hover:underline font-medium"
                                    >
                                        View all →
                                    </button>
                                </div>
                                <div className="space-y-3">
                                    {[
                                        <div
                                            key={job["title"]}
                                            className="flex items-center justify-between py-2 border-b border-gray-100 last:border-0"
                                        >
                                            <div className="min-w-0">
                                                <p
                                                    className="text-sm font-semibold text-[#2dd4bf]"
                                                >
                                                    {job["title"]}
                                                </p>
                                                <p className="text-xs text-gray-500">
                                                    {job["company"]}
                                                </p>
                                                <p className="text-xs text-gray-400">
                                                    {job["location"]}
                                                </p>
                                            </div>
                                            <ChevronRight
                                                size={16}
                                                className="text-[#2dd4bf] shrink-0"
                                            />
                                        </div> for job in JOBS
                                    ]}
                                </div>
                            </div>
                            <div
                                className="rounded-xl border border-gray-200 bg-white p-4 sm:p-5"
                            >
                                <h3 className="font-bold text-[#0f2027] mb-3">
                                    Your Skills Snapshot
                                </h3>
                                <div className="grid grid-cols-2 gap-2">
                                    {[
                                        <div
                                            key={s}
                                            className="flex items-center gap-2 text-sm"
                                        >
                                            <span
                                                className="w-5 h-5 rounded-full bg-[#2dd4bf]/15 flex items-center justify-center shrink-0"
                                            >
                                                <Check
                                                    size={12}
                                                    className="text-[#2dd4bf]"
                                                />
                                            </span>
                                            <span className="text-gray-700 text-xs">
                                                {s}
                                            </span>
                                        </div> for s in MATCHED_SKILLS
                                    ]}{[
                                        <div
                                            key={s}
                                            className="flex items-center gap-2 text-sm"
                                        >
                                            <span
                                                className="w-5 h-5 rounded-full bg-red-100 flex items-center justify-center shrink-0"
                                            >
                                                <X size={12} className="text-red-400"/>
                                            </span>
                                            <span className="text-gray-700 text-xs">
                                                {s}
                                            </span>
                                        </div> for s in MISSING_SKILLS
                                    ]}
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>;
}
