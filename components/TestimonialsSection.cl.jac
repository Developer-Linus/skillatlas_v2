import from "lucide-react" { Star }

def:pub TestimonialsSection -> JsxElement {
    return
        <section id="success-stories" className="bg-[#0f2027] py-20 pt-24 scroll-mt-20">
            <div className="container mx-auto px-6">
                <div className="text-center mb-16">
                    <span
                        className="inline-block text-sm font-semibold tracking-widest uppercase text-[#2dd4bf] mb-4"
                    >
                        Success Stories
                    </span>
                    <h2
                        className="font-display text-3xl md:text-4xl font-bold text-white mb-4"
                    >
                        Trusted by Thousands of Learners
                    </h2>
                    <p className="text-white/75 max-w-xl mx-auto">
                        Real stories from real people who transformed their careers with SkillAtlas.
                    </p>
                </div>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
                    <div
                        className="rounded-2xl p-8 hover:shadow-lg transition-shadow"
                        style={{
                            "background": "rgba(255,255,255,0.06)",
                            "border": "1px solid rgba(45,212,191,0.2)"
                        }}
                    >
                        <div className="flex gap-1 mb-4">
                            <Star size={18} className="fill-[#2dd4bf] text-[#2dd4bf]"/>
                            <Star size={18} className="fill-[#2dd4bf] text-[#2dd4bf]"/>
                            <Star size={18} className="fill-[#2dd4bf] text-[#2dd4bf]"/>
                            <Star size={18} className="fill-[#2dd4bf] text-[#2dd4bf]"/>
                            <Star size={18} className="fill-[#2dd4bf] text-[#2dd4bf]"/>
                        </div>
                        <p className="text-white/75 leading-relaxed mb-6 italic">
                            "SkillAtlas transformed my career trajectory. The structured programs and mentorship helped me land my dream role within 6 months."
                        </p>
                        <div>
                            <p className="font-display font-semibold text-white">
                                Sarah Chen
                            </p>
                            <p className="text-sm text-white/50">
                                Software Engineer at Google
                            </p>
                        </div>
                        <span
                            className="inline-block mt-4 px-4 py-1.5 text-xs font-semibold rounded-full bg-[#2dd4bf]/10 text-[#2dd4bf] border border-[#2dd4bf]/20"
                        >
                            Hired in 3 months
                        </span>
                    </div>
                    <div
                        className="rounded-2xl p-8 hover:shadow-lg transition-shadow"
                        style={{
                            "background": "rgba(255,255,255,0.06)",
                            "border": "1px solid rgba(45,212,191,0.2)"
                        }}
                    >
                        <div className="flex gap-1 mb-4">
                            <Star size={18} className="fill-[#2dd4bf] text-[#2dd4bf]"/>
                            <Star size={18} className="fill-[#2dd4bf] text-[#2dd4bf]"/>
                            <Star size={18} className="fill-[#2dd4bf] text-[#2dd4bf]"/>
                            <Star size={18} className="fill-[#2dd4bf] text-[#2dd4bf]"/>
                            <Star size={18} className="fill-[#2dd4bf] text-[#2dd4bf]"/>
                        </div>
                        <p className="text-white/75 leading-relaxed mb-6 italic">
                            "The community here is incredible. I went from zero coding experience to a full-time data role. The courses are practical and industry-relevant."
                        </p>
                        <div>
                            <p className="font-display font-semibold text-white">
                                Marcus Johnson
                            </p>
                            <p className="text-sm text-white/50">
                                Data Analyst at Shopify
                            </p>
                        </div>
                        <span
                            className="inline-block mt-4 px-4 py-1.5 text-xs font-semibold rounded-full bg-[#2dd4bf]/10 text-[#2dd4bf] border border-[#2dd4bf]/20"
                        >
                            Offer in 2 months
                        </span>
                    </div>
                    <div
                        className="rounded-2xl p-8 hover:shadow-lg transition-shadow"
                        style={{
                            "background": "rgba(255,255,255,0.06)",
                            "border": "1px solid rgba(45,212,191,0.2)"
                        }}
                    >
                        <div className="flex gap-1 mb-4">
                            <Star size={18} className="fill-[#2dd4bf] text-[#2dd4bf]"/>
                            <Star size={18} className="fill-[#2dd4bf] text-[#2dd4bf]"/>
                            <Star size={18} className="fill-[#2dd4bf] text-[#2dd4bf]"/>
                            <Star size={18} className="fill-[#2dd4bf] text-[#2dd4bf]"/>
                            <Star size={18} className="fill-[#2dd4bf] text-[#2dd4bf]"/>
                        </div>
                        <p className="text-white/75 leading-relaxed mb-6 italic">
                            "What sets SkillAtlas apart is the real-world projects. I built a portfolio that actually impressed hiring managers. Worth every minute."
                        </p>
                        <div>
                            <p className="font-display font-semibold text-white">
                                Priya Patel
                            </p>
                            <p className="text-sm text-white/50">
                                UX Designer at Figma
                            </p>
                        </div>
                        <span
                            className="inline-block mt-4 px-4 py-1.5 text-xs font-semibold rounded-full bg-[#2dd4bf]/10 text-[#2dd4bf] border border-[#2dd4bf]/20"
                        >
                            Promoted in 4 months
                        </span>
                    </div>
                </div>
            </div>
        </section>;
}
