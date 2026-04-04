import from "lucide-react" { UserPlus, FileUp, ScanSearch, Target, GraduationCap }

def:pub HowItWorksSection -> JsxElement {
    return
        <section id="how-it-works" className="bg-[#0f1f2e] py-20 pt-24 scroll-mt-20">
            <div className="container mx-auto px-6">
                <div className="max-w-3xl mx-auto text-center mb-16">
                    <span
                        className="inline-block text-sm font-semibold tracking-widest uppercase text-[#2dd4bf] mb-4"
                    >
                        How It Works
                    </span>
                    <h2
                        className="font-display text-3xl md:text-5xl font-bold text-white"
                    >
                        Get Started in 5 Simple Steps
                    </h2>
                </div>
                <div className="max-w-2xl mx-auto">
                    <div className="flex items-start gap-5">
                        <div className="flex flex-col items-center">
                            <div
                                className="flex items-center justify-center w-12 h-12 rounded-full bg-[#0f2027] border-2 border-[#2dd4bf] text-[#2dd4bf] shrink-0 font-display font-bold text-sm"
                            >
                                1
                            </div>
                            <div
                                className="w-0.5 h-16 mt-2"
                                style={{"background": "rgba(45,212,191,0.3)"}}
                            />
                        </div>
                        <div className="pb-12">
                            <div className="flex items-center gap-2 mb-1">
                                <UserPlus size={18} className="text-[#2dd4bf]"/>
                                <h3
                                    className="font-display text-lg font-semibold text-white"
                                >
                                    Sign Up
                                </h3>
                            </div>
                            <p className="text-white/60 text-sm leading-relaxed">
                                Create an account in seconds to get started.
                            </p>
                        </div>
                    </div>
                    <div className="flex items-start gap-5">
                        <div className="flex flex-col items-center">
                            <div
                                className="flex items-center justify-center w-12 h-12 rounded-full bg-[#0f2027] border-2 border-[#2dd4bf] text-[#2dd4bf] shrink-0 font-display font-bold text-sm"
                            >
                                2
                            </div>
                            <div
                                className="w-0.5 h-16 mt-2"
                                style={{"background": "rgba(45,212,191,0.3)"}}
                            />
                        </div>
                        <div className="pb-12">
                            <div className="flex items-center gap-2 mb-1">
                                <FileUp size={18} className="text-[#2dd4bf]"/>
                                <h3
                                    className="font-display text-lg font-semibold text-white"
                                >
                                    Upload CV & Select Role
                                </h3>
                            </div>
                            <p className="text-white/60 text-sm leading-relaxed">
                                Share your background and choose your target tech or data role.
                            </p>
                        </div>
                    </div>
                    <div className="flex items-start gap-5">
                        <div className="flex flex-col items-center">
                            <div
                                className="flex items-center justify-center w-12 h-12 rounded-full bg-[#0f2027] border-2 border-[#2dd4bf] text-[#2dd4bf] shrink-0 font-display font-bold text-sm"
                            >
                                3
                            </div>
                            <div
                                className="w-0.5 h-16 mt-2"
                                style={{"background": "rgba(45,212,191,0.3)"}}
                            />
                        </div>
                        <div className="pb-12">
                            <div className="flex items-center gap-2 mb-1">
                                <ScanSearch size={18} className="text-[#2dd4bf]"/>
                                <h3
                                    className="font-display text-lg font-semibold text-white"
                                >
                                    Skill Profile
                                </h3>
                            </div>
                            <p className="text-white/60 text-sm leading-relaxed">
                                SkillAtlas identifies your current skills and experience.
                            </p>
                        </div>
                    </div>
                    <div className="flex items-start gap-5">
                        <div className="flex flex-col items-center">
                            <div
                                className="flex items-center justify-center w-12 h-12 rounded-full bg-[#0f2027] border-2 border-[#2dd4bf] text-[#2dd4bf] shrink-0 font-display font-bold text-sm"
                            >
                                4
                            </div>
                            <div
                                className="w-0.5 h-16 mt-2"
                                style={{"background": "rgba(45,212,191,0.3)"}}
                            />
                        </div>
                        <div className="pb-12">
                            <div className="flex items-center gap-2 mb-1">
                                <Target size={18} className="text-[#2dd4bf]"/>
                                <h3
                                    className="font-display text-lg font-semibold text-white"
                                >
                                    Role Match Score
                                </h3>
                            </div>
                            <p className="text-white/60 text-sm leading-relaxed">
                                See how closely your skills align with your chosen role and where the gaps are.
                            </p>
                        </div>
                    </div>
                    <div className="flex items-start gap-5">
                        <div className="flex flex-col items-center">
                            <div
                                className="flex items-center justify-center w-12 h-12 rounded-full bg-[#0f2027] border-2 border-[#2dd4bf] text-[#2dd4bf] shrink-0 font-display font-bold text-sm"
                            >
                                5
                            </div>
                        </div>
                        <div className="pb-12">
                            <div className="flex items-center gap-2 mb-1">
                                <GraduationCap size={18} className="text-[#2dd4bf]"/>
                                <h3
                                    className="font-display text-lg font-semibold text-white"
                                >
                                    Personalised Learning Path
                                </h3>
                            </div>
                            <p className="text-white/60 text-sm leading-relaxed">
                                Receive clear, actionable steps to build job-ready skills.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>;
}
