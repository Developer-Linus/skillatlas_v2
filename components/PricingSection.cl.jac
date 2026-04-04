import from "lucide-react" { Check, Shield, CreditCard }

glob PRO_PRICES: dict = {
         "monthly": {"price": "$4", "note": "/month"},
         "quarterly": {"price": "$10", "note": "Save 17%"},
         "biannual": {"price": "$18", "note": "Save 25%"},
         "annual": {"price": "$40", "note": "Save 44%"},

     };

def:pub PricingSection(onGetStarted: any = None) -> JsxElement {
    has billing: str = "monthly";

    def handleGetStarted -> None {
        if onGetStarted {
            onGetStarted();
        }
    }

    price_info: dict = PRO_PRICES[billing];

    return
        <section id="pricing" className="bg-[#0a1628] py-20 pt-24 scroll-mt-20">
            <div className="container mx-auto px-6">
                <div className="text-center mb-14">
                    <h2
                        className="font-display text-3xl md:text-5xl font-bold text-white mb-4"
                    >
                        Simple, transparent pricing
                    </h2>
                    <p className="text-white/60 text-lg max-w-xl mx-auto">
                        Pick a plan that fits your journey. Upgrade or cancel anytime.
                    </p>
                </div>
                <div className="flex justify-center mb-12">
                    <div
                        className="inline-flex bg-white/5 rounded-full p-1 border border-white/10"
                    >
                        <button
                            onClick={lambda -> None { billing = "monthly";}}
                            className={f"px-4 py-2 text-sm font-medium rounded-full transition-colors {'bg-[#2dd4bf] text-[#0f2027]'
                                if billing == 'monthly'
                                else 'text-white/60 hover:text-white'}"}
                        >
                            Monthly
                        </button>
                        <button
                            onClick={lambda -> None { billing = "quarterly";}}
                            className={f"px-4 py-2 text-sm font-medium rounded-full transition-colors {'bg-[#2dd4bf] text-[#0f2027]'
                                if billing == 'quarterly'
                                else 'text-white/60 hover:text-white'}"}
                        >
                            Quarterly
                        </button>
                        <button
                            onClick={lambda -> None { billing = "biannual";}}
                            className={f"px-4 py-2 text-sm font-medium rounded-full transition-colors {'bg-[#2dd4bf] text-[#0f2027]'
                                if billing == 'biannual'
                                else 'text-white/60 hover:text-white'}"}
                        >
                            6 Months
                        </button>
                        <button
                            onClick={lambda -> None { billing = "annual";}}
                            className={f"px-4 py-2 text-sm font-medium rounded-full transition-colors {'bg-[#2dd4bf] text-[#0f2027]'
                                if billing == 'annual'
                                else 'text-white/60 hover:text-white'}"}
                        >
                            Annual
                        </button>
                    </div>
                </div>
                <div
                    className="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-5xl mx-auto items-stretch"
                >
                    <div
                        className="rounded-2xl border border-white/10 bg-white/5 p-8 flex flex-col"
                    >
                        <h3 className="font-display text-xl font-bold text-white mb-1">
                            The Starter
                        </h3>
                        <p className="text-white/50 text-sm mb-6">
                            30-Day Free Trial
                        </p>
                        <div className="mb-8">
                            <span className="font-display text-4xl font-bold text-white">
                                $0
                            </span>
                            <span className="text-white/50 ml-1">
                                / 30 days
                            </span>
                        </div>
                        <ul className="space-y-3 mb-10 flex-1">
                            <li className="flex items-start gap-2 text-sm text-white/80">
                                <Check
                                    size={16}
                                    className="text-[#2dd4bf] mt-0.5 shrink-0"
                                />
                                3 CV Optimizations/mo
                            </li>
                            <li className="flex items-start gap-2 text-sm text-white/80">
                                <Check
                                    size={16}
                                    className="text-[#2dd4bf] mt-0.5 shrink-0"
                                />
                                Basic Skill Mapping
                            </li>
                            <li className="flex items-start gap-2 text-sm text-white/80">
                                <Check
                                    size={16}
                                    className="text-[#2dd4bf] mt-0.5 shrink-0"
                                />
                                5 Job Matches/mo
                            </li>
                            <li
                                className="flex items-start gap-2 text-sm text-white/80"
                            >
                                <Check
                                    size={16}
                                    className="text-[#2dd4bf] mt-0.5 shrink-0"
                                />
                                Weekly Market Trend Insights
                            </li>
                        </ul>
                        <button
                            className="w-full py-2.5 rounded-lg border border-[#2dd4bf] text-[#2dd4bf] hover:bg-[#2dd4bf]/10 font-semibold text-sm transition-colors"
                            onClick={lambda -> None { handleGetStarted();}}
                        >
                            Start Free
                        </button>
                    </div>
                    <div
                        className="relative rounded-2xl border-2 border-[#2dd4bf] bg-[#2dd4bf]/5 p-8 flex flex-col shadow-lg shadow-[#2dd4bf]/10"
                    >
                        <div
                            className="absolute -top-3 left-1/2 -translate-x-1/2 bg-[#2dd4bf] text-[#0f2027] text-xs font-bold px-4 py-1 rounded-full"
                        >
                            Most Popular
                        </div>
                        <h3 className="font-display text-xl font-bold text-white mb-1">
                            The Pro
                        </h3>
                        <p className="text-white/50 text-sm mb-6">
                            For serious job seekers
                        </p>
                        <div className="mb-2">
                            <span className="font-display text-4xl font-bold text-white">
                                {price_info["price"]}
                            </span>
                            {(billing == "monthly")
                            and <span className="text-white/50 ml-1">
                                /month
                            </span>}
                        </div>
                        {(billing != "monthly")
                        and <p className="text-[#2dd4bf] text-sm font-semibold mb-6">
                            {price_info["note"]}
                        </p>}
                        {(billing == "monthly") and <div className="mb-6"/>}
                        <ul className="space-y-3 mb-10 flex-1">
                            <li className="flex items-start gap-2 text-sm text-white/80">
                                <Check
                                    size={16}
                                    className="text-[#2dd4bf] mt-0.5 shrink-0"
                                />
                                Unlimited CV Analysis & Optimization
                            </li>
                            <li className="flex items-start gap-2 text-sm text-white/80">
                                <Check
                                    size={16}
                                    className="text-[#2dd4bf] mt-0.5 shrink-0"
                                />
                                Full Interactive Skill Roadmap
                            </li>
                            <li className="flex items-start gap-2 text-sm text-white/80">
                                <Check
                                    size={16}
                                    className="text-[#2dd4bf] mt-0.5 shrink-0"
                                />
                                Unlimited AI-Powered Job Matching
                            </li>
                            <li className="flex items-start gap-2 text-sm text-white/80">
                                <Check
                                    size={16}
                                    className="text-[#2dd4bf] mt-0.5 shrink-0"
                                />
                                Phased Career Roadmaps (Junior → Lead)
                            </li>
                            <li
                                className="flex items-start gap-2 text-sm text-white/80"
                            >
                                <Check
                                    size={16}
                                    className="text-[#2dd4bf] mt-0.5 shrink-0"
                                />
                                Priority Email Support
                            </li>
                        </ul>
                        <button
                            className="w-full py-2.5 rounded-lg bg-[#2dd4bf] text-[#0f2027] hover:bg-[#2dd4bf]/90 font-bold text-sm transition-colors"
                            onClick={lambda -> None { handleGetStarted();}}
                        >
                            Go Pro
                        </button>
                    </div>
                    <div
                        className="rounded-2xl border border-white/10 bg-white/5 p-8 flex flex-col"
                    >
                        <h3 className="font-display text-xl font-bold text-white mb-1">
                            The Campus
                        </h3>
                        <p className="text-white/50 text-sm mb-6">
                            Institutional
                        </p>
                        <div className="mb-8">
                            <span
                                className="font-display text-4xl font-bold text-white"
                            >
                                Custom
                            </span>
                        </div>
                        <ul className="space-y-3 mb-10 flex-1">
                            <li className="flex items-start gap-2 text-sm text-white/80">
                                <Check
                                    size={16}
                                    className="text-[#2dd4bf] mt-0.5 shrink-0"
                                />
                                Bulk Student Onboarding
                            </li>
                            <li className="flex items-start gap-2 text-sm text-white/80">
                                <Check
                                    size={16}
                                    className="text-[#2dd4bf] mt-0.5 shrink-0"
                                />
                                Admin Analytics Dashboard
                            </li>
                            <li className="flex items-start gap-2 text-sm text-white/80">
                                <Check
                                    size={16}
                                    className="text-[#2dd4bf] mt-0.5 shrink-0"
                                />
                                Custom Branding
                            </li>
                            <li
                                className="flex items-start gap-2 text-sm text-white/80"
                            >
                                <Check
                                    size={16}
                                    className="text-[#2dd4bf] mt-0.5 shrink-0"
                                />
                                API Access
                            </li>
                        </ul>
                        <button
                            className="w-full py-2.5 rounded-lg border border-[#2dd4bf] text-[#2dd4bf] hover:bg-[#2dd4bf]/10 font-semibold text-sm transition-colors"
                        >
                            Contact Sales
                        </button>
                    </div>
                </div>
                <div
                    className="flex flex-wrap justify-center items-center gap-6 mt-10 text-white/40 text-sm"
                >
                    <span className="flex items-center gap-1.5">
                        <Shield size={16}/>
                        Secure Payment
                    </span>
                    <span className="flex items-center gap-1.5">
                        <CreditCard size={16}/>
                        Cancel Anytime
                    </span>
                </div>
            </div>
        </section>;
}
