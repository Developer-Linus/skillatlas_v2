import from "lucide-react" { ExternalLink }

def:pub OurTeamSection -> JsxElement {
    return
        <section id="our-team" className="bg-[#0f2027] py-20 pt-24 scroll-mt-20">
            <div className="container mx-auto px-6">
                <div className="text-center mb-12">
                    <span
                        className="inline-block text-sm font-semibold tracking-widest uppercase text-[#2dd4bf] mb-4"
                    >
                        Our Mission
                    </span>
                    <h2
                        className="font-display text-3xl md:text-5xl font-bold text-white"
                    >
                        Why We Built SkillAtlas
                    </h2>
                </div>
                <div className="max-w-3xl mx-auto space-y-6 mb-20">
                    <p className="text-lg text-white/60 leading-relaxed">
                        Too many people waste months learning skills that don't match what employers actually want. They follow outdated advice, random YouTube playlists, and course recommendations that lead nowhere.
                    </p>
                    <p className="text-lg text-white font-medium leading-relaxed">
                        SkillAtlas exists to fix that — by connecting your learning directly to real job market demand, so every hour you invest moves you closer to getting hired.
                    </p>
                </div>
                <div className="text-center mb-12">
                    <span
                        className="inline-block text-sm font-semibold tracking-widest uppercase text-[#2dd4bf] mb-4"
                    >
                        Meet Us
                    </span>
                    <h2
                        className="font-display text-3xl md:text-5xl font-bold text-white"
                    >
                        Our Team
                    </h2>
                </div>
                <div className="flex flex-col items-center">
                    <div
                        className="w-full max-w-md rounded-[10px] shadow-lg overflow-hidden"
                        style={{
                            "background": "rgba(255,255,255,0.06)",
                            "border": "1px solid rgba(45,212,191,0.2)"
                        }}
                    >
                        <img
                            src="/assets/images/founding-team.png"
                            alt="The SkillAtlas Founding Team"
                            className="w-full h-auto object-cover block"
                        />
                        <div className="grid grid-cols-3 px-3 py-4">
                            <a
                                href="https://linkedin.com/in/linuslangat"
                                target="_blank"
                                rel="noopener noreferrer"
                                className="flex items-center justify-center gap-1 text-[11px] font-semibold text-white/80 hover:text-white transition-colors text-center whitespace-nowrap"
                            >
                                <ExternalLink
                                    size={11}
                                    className="text-[#0A66C2] shrink-0"
                                />
                                Linus Langat
                            </a>
                            <a
                                href="https://linkedin.com/in/rosalyne-muchiri-357050186"
                                target="_blank"
                                rel="noopener noreferrer"
                                className="flex items-center justify-center gap-1 text-[11px] font-semibold text-white/80 hover:text-white transition-colors text-center whitespace-nowrap"
                            >
                                <ExternalLink
                                    size={11}
                                    className="text-[#0A66C2] shrink-0"
                                />
                                Rosalyne Muchiri
                            </a>
                            <a
                                href="https://linkedin.com/in/peter-kemei-71745b215"
                                target="_blank"
                                rel="noopener noreferrer"
                                className="flex items-center justify-center gap-1 text-[11px] font-semibold text-white/80 hover:text-white transition-colors text-center whitespace-nowrap"
                            >
                                <ExternalLink
                                    size={11}
                                    className="text-[#0A66C2] shrink-0"
                                />
                                Peter Kemei
                            </a>
                        </div>
                    </div>
                    <p className="mt-4 text-sm italic text-white/60">
                        The minds behind SkillAtlas
                    </p>
                </div>
            </div>
        </section>;
}
