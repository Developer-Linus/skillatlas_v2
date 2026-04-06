import from "lucide-react" { ArrowRight }
import from "@jac/runtime" { jacIsLoggedIn, useNavigate }
import from "..utils/gsap" { gsap, SplitText, useGSAP }

def:pub HeroSection(onGetStarted: any = None) -> JsxElement {
    isLoggedIn: bool = jacIsLoggedIn();
    navigate: any = useNavigate();

    def handleGetStarted -> None {
        if isLoggedIn {
            navigate("/dashboard");
        } elif onGetStarted {
            onGetStarted();
        }
    }

    useGSAP(
        lambda { charStagger = 0.03;split = SplitText.create(
            "#hero-heading", {"type": "words, chars"}
        );tl = gsap.timeline({"defaults": {"ease": "power3.out"}});tl.from(
            "#hero-badge", {"y": -20, "opacity": 0, "duration": 0.5}
        ).from(
            split.chars,
            {
                "y": 80,
                "opacity": 0,
                "duration": 0.6,
                "stagger": charStagger,
                "ease": "back.out(1.4)"
            },
            "-=0.2"
        ).from(
            "#hero-para", {"y": 32, "opacity": 0, "duration": 0.6}, "-=0.3"
        ).from(
            "#hero-cta", {"scale": 0.92, "opacity": 0, "duration": 0.45}, "-=0.2"
        );}
    );

    return
        <section
            className="relative min-h-screen flex items-center justify-center overflow-hidden"
        >
            <img
                src="/assets/images/hero-bg.png"
                alt="African professionals collaborating in a modern workspace"
                className="absolute inset-0 w-full h-full object-cover"
                width={1920}
                height={1080}
            />
            <div
                className="absolute inset-0"
                style={{
                    "background": "linear-gradient(90deg, rgba(15,32,39,0.75) 0%, rgba(15,32,39,0.65) 45%, rgba(15,32,39,0.05) 100%)"
                }}
            />
            <div
                className="absolute inset-0 bg-gradient-to-t from-[rgba(15,32,39,0.5)] via-transparent to-transparent"
            />
            <div className="relative z-10 container mx-auto px-6 pt-28 pb-20">
                <div className="max-w-3xl mx-auto flex flex-col items-center">
                    <span
                        id="hero-badge"
                        className="self-start rounded-full px-5 py-2 text-sm font-bold text-[#2dd4bf] border border-[#2dd4bf]/40 bg-white/5 backdrop-blur-sm mb-4"
                    >
                        Join 10,000+ learners transforming their careers
                    </span>
                    <h1
                        id="hero-heading"
                        className="font-display md:text-[72px] text-5xl sm:text-6xl font-bold text-white leading-tight mb-6 drop-shadow-[0_3px_12px_rgba(0,0,0,0.5)]"
                        style={{"letterSpacing": "-0.02em"}}
                    >
                        Map Your
                        <span className="text-[#2dd4bf]">
                            Skills
                        </span>
                        .
                        {" "}
                        Chart Your
                        <span className="text-[#2dd4bf]">
                            Future
                        </span>
                        .
                    </h1>
                    <p
                        id="hero-para"
                        className="text-[22px] font-normal text-[#D1D5DB] max-w-2xl mx-auto mb-10 font-body leading-relaxed drop-shadow-[0_1px_6px_rgba(0,0,0,0.5)]"
                    >
                        SkillAtlas connects you to world-class programs, curated courses, and real job opportunities—all in one platform designed for your growth.
                    </p>
                    <div
                        id="hero-cta"
                        className="flex flex-col sm:flex-row items-center justify-center gap-4"
                    >
                        <button
                            className="flex items-center gap-2 text-lg px-8 py-4 bg-[#fbbf24] text-[#0f2027] hover:bg-[#fbbf24]/90 font-bold rounded-xl shadow-[0_4px_20px_rgba(251,191,36,0.4)] hover:shadow-[0_6px_28px_rgba(251,191,36,0.5)] transition-all"
                            onClick={lambda -> None { handleGetStarted();}}
                        >
                            {"Go to Dashboard"
                                if isLoggedIn
                                else "Get Started for Free"}
                            <ArrowRight size={20}/>
                        </button>
                    </div>
                </div>
            </div>
            <div
                className="absolute bottom-0 left-0 right-0 h-32"
                style={{
                    "background": "linear-gradient(to top, rgba(15,32,39,1), transparent)"
                }}
            />
        </section>;
}
