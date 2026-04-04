import from "lucide-react" { ArrowRight }

def:pub CTASection(onGetStarted: any = None) -> JsxElement {
    def handleGetStarted -> None {
        if onGetStarted {
            onGetStarted();
        }
    }

    return
        <section className="py-20 pt-24 bg-[#0a1628]">
            <div className="container mx-auto px-6">
                <div
                    className="relative overflow-hidden rounded-3xl bg-[#0f2027] p-12 md:p-20 text-center"
                >
                    <div
                        className="absolute inset-0 bg-gradient-to-br from-[#2dd4bf]/20 to-transparent"
                    />
                    <div className="relative z-10">
                        <h2
                            className="font-display text-3xl md:text-5xl font-bold text-white mb-6"
                        >
                            Ready to Start Your Journey?
                        </h2>
                        <p className="text-white/80 max-w-xl mx-auto mb-10 text-lg">
                            Join a thriving community of learners and unlock courses, mentorship, and career opportunities—completely free to start.
                        </p>
                        <button
                            className="inline-flex items-center gap-2 text-lg px-10 py-4 bg-[#fbbf24] text-[#0f2027] hover:bg-[#fbbf24]/90 font-bold rounded-xl transition-colors"
                            onClick={lambda -> None { handleGetStarted();}}
                        >
                            Get Started for Free
                            <ArrowRight size={20}/>
                        </button>
                    </div>
                </div>
            </div>
        </section>;
}
