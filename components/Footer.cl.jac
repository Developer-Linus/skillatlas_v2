import from ".BrandLogo" { BrandLogo }
import from "lucide-react" { ExternalLink, Mail, MessageCircle, ArrowUpRight }

def:pub Footer -> JsxElement {
    return
        <footer className="bg-[#071318] border-t border-white/10">
            <div className="container mx-auto px-6 pt-16 pb-10">
                <div className="grid grid-cols-1 md:grid-cols-5 gap-12 mb-14">
                    <div className="md:col-span-2">
                        <BrandLogo/>
                        <p className="text-white/40 mt-4 text-sm leading-relaxed">
                            Empowering learners worldwide to build skills that matter and launch meaningful careers in tech.
                        </p>
                        <div className="flex items-center gap-3 mt-6">
                            <a
                                href="https://linkedin.com/company/skillatlas"
                                target="_blank"
                                rel="noopener noreferrer"
                                className="text-white/40 hover:text-white transition-colors"
                                aria-label="LinkedIn"
                            >
                                <ExternalLink size={16}/>
                            </a>
                            <a
                                href="mailto:hello@skillatlas.com"
                                className="text-white/40 hover:text-white transition-colors"
                                aria-label="Email"
                            >
                                <Mail size={16}/>
                            </a>
                            <a
                                href="https://wa.me/254700000000"
                                target="_blank"
                                rel="noopener noreferrer"
                                className="text-white/40 hover:text-white transition-colors"
                                aria-label="WhatsApp"
                            >
                                <MessageCircle size={16}/>
                            </a>
                        </div>
                    </div>
                    <div>
                        <h4 className="font-display font-semibold text-white mb-4">
                            Product
                        </h4>
                        <ul className="space-y-3">
                            <li>
                                <a
                                    href="#features"
                                    className="text-sm text-white/40 hover:text-white transition-colors"
                                >
                                    Features
                                </a>
                            </li>
                            <li>
                                <a
                                    href="#how-it-works"
                                    className="text-sm text-white/40 hover:text-white transition-colors"
                                >
                                    How It Works
                                </a>
                            </li>
                            <li>
                                <a
                                    href="#pricing"
                                    className="text-sm text-white/40 hover:text-white transition-colors"
                                >
                                    Pricing
                                </a>
                            </li>
                            <li>
                                <a
                                    href="#success-stories"
                                    className="text-sm text-white/40 hover:text-white transition-colors"
                                >
                                    Success Stories
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h4 className="font-display font-semibold text-white mb-4">
                            Company
                        </h4>
                        <ul className="space-y-3">
                            <li>
                                <a
                                    href="#our-team"
                                    className="text-sm text-white/40 hover:text-white transition-colors"
                                >
                                    About Us
                                </a>
                            </li>
                            <li>
                                <a
                                    href="#"
                                    className="inline-flex items-center gap-1 text-sm text-white/40 hover:text-white transition-colors"
                                >
                                    Blog
                                    <ArrowUpRight size={12}/>
                                </a>
                            </li>
                            <li>
                                <a
                                    href="#"
                                    className="inline-flex items-center gap-1 text-sm text-white/40 hover:text-white transition-colors"
                                >
                                    Careers
                                    <ArrowUpRight size={12}/>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h4 className="font-display font-semibold text-white mb-4">
                            Legal & Support
                        </h4>
                        <ul className="space-y-3">
                            <li>
                                <a
                                    href="#"
                                    className="text-sm text-white/40 hover:text-white transition-colors"
                                >
                                    Privacy Policy
                                </a>
                            </li>
                            <li>
                                <a
                                    href="#"
                                    className="text-sm text-white/40 hover:text-white transition-colors"
                                >
                                    Terms of Service
                                </a>
                            </li>
                            <li>
                                <a
                                    href="mailto:hello@skillatlas.com"
                                    className="text-sm text-white/40 hover:text-white transition-colors"
                                >
                                    hello@skillatlas.com
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div
                    className="border-t border-white/10 pt-8 flex flex-col sm:flex-row items-center justify-between gap-4"
                >
                    <p className="text-sm text-white/30">
                        ©{Date().split(" ")[3]} SkillAtlas. All rights reserved.
                    </p>
                    <p className="text-sm text-white/30">
                        Built for the next generation of tech professionals.
                    </p>
                </div>
            </div>
        </footer>;
}
