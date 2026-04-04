import from "lucide-react" { BarChart3, Target, Clock, Route, TrendingUp, Briefcase }

glob FEATURES: list = [
         {
             "icon": None,
             "title": "Real-Time Demand Data",
             "desc": "Skills ranked by what employers are actually hiring for right now."
         },
         {
             "icon": None,
             "title": "Personal Skill Gap Analysis",
             "desc": "See exactly what's missing from your profile — no generic advice."
         },
         {
             "icon": None,
             "title": "Time to Job Readiness",
             "desc": "Know how long until you're competitive for your target role."
         },
         {
             "icon": None,
             "title": "Tailored Career Paths",
             "desc": "Every recommendation is built around your goals, not a one-size-fits-all course list."
         },
         {
             "icon": None,
             "title": "Progress Tracking",
             "desc": "See where you stand and what to focus on next, at a glance."
         },
         {
             "icon": None,
             "title": "Designed to Get You Hired",
             "desc": "Every feature exists to move you closer to a real job offer."
         },

     ];

def:pub FeatureCard(icon: any, title: str, desc: str) -> JsxElement {
    return
        <div
            className="rounded-2xl border border-[#c8f5ed]/20 bg-white/5 p-8 hover:shadow-lg hover:bg-white/10 transition-all"
        >
            <div
                className="inline-flex items-center justify-center w-12 h-12 rounded-xl bg-[#e1faf5] text-[#2dd4bf] mb-5"
            >
                {icon}
            </div>
            <h3 className="font-display text-lg font-semibold text-white mb-2">
                {title}
            </h3>
            <p className="text-white/60 text-sm leading-relaxed">
                {desc}
            </p>
        </div>;
}

def:pub FeaturesSection -> JsxElement {
    return
        <section id="features" className="bg-[#0a1628] py-20 pt-24 scroll-mt-20">
            <div className="container mx-auto px-6">
                <div className="max-w-3xl mx-auto text-center mb-16">
                    <span
                        className="inline-block text-sm font-semibold tracking-widest uppercase text-[#2dd4bf] mb-4"
                    >
                        Features
                    </span>
                    <h2
                        className="font-display text-3xl md:text-5xl font-bold text-white mb-4"
                    >
                        Everything You Need to Land the Job
                    </h2>
                    <p className="text-lg text-white/60">
                        Real insights from real job postings — not guesswork or generic advice.
                    </p>
                </div>
                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
                    <FeatureCard
                        icon={<BarChart3 size={24}/>}
                        title="Real-Time Demand Data"
                        desc="Skills ranked by what employers are actually hiring for right now."
                    />
                    <FeatureCard
                        icon={<Target size={24}/>}
                        title="Personal Skill Gap Analysis"
                        desc="See exactly what's missing from your profile — no generic advice."
                    />
                    <FeatureCard
                        icon={<Clock size={24}/>}
                        title="Time to Job Readiness"
                        desc="Know how long until you're competitive for your target role."
                    />
                    <FeatureCard
                        icon={<Route size={24}/>}
                        title="Tailored Career Paths"
                        desc="Every recommendation is built around your goals, not a one-size-fits-all course list."
                    />
                    <FeatureCard
                        icon={<TrendingUp size={24}/>}
                        title="Progress Tracking"
                        desc="See where you stand and what to focus on next, at a glance."
                    />
                    <FeatureCard
                        icon={<Briefcase size={24}/>}
                        title="Designed to Get You Hired"
                        desc="Every feature exists to move you closer to a real job offer."
                    />
                </div>
            </div>
        </section>;
}
