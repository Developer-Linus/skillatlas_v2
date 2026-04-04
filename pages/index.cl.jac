import from "../components/Navbar" { Navbar }
import from "../components/HeroSection" { HeroSection }
import from "../components/StatsSection" { StatsSection }
import from "../components/FeaturesSection" { FeaturesSection }
import from "../components/HowItWorksSection" { HowItWorksSection }
import from "../components/TestimonialsSection" { TestimonialsSection }
import from "../components/PricingSection" { PricingSection }
import from "../components/OurTeamSection" { OurTeamSection }
import from "../components/CTASection" { CTASection }
import from "../components/Footer" { Footer }
import from "../components/SignUpModal" { SignUpModal }

def:pub page -> JsxElement {
    has modalOpen: bool = False;

    def openModal -> None {
        modalOpen = True;
    }

    def handleModalChange(value: any) -> None {
        modalOpen = value;
    }

    return
        <div className="min-h-screen bg-[#0f2027]">
            <Navbar onGetStarted={lambda -> None { openModal();}}/>
            <main>
                <HeroSection onGetStarted={lambda -> None { openModal();}}/>
                <StatsSection/>
                <FeaturesSection/>
                <HowItWorksSection/>
                <TestimonialsSection/>
                <PricingSection onGetStarted={lambda -> None { openModal();}}/>
                <OurTeamSection/>
                <CTASection onGetStarted={lambda -> None { openModal();}}/>
            </main>
            <Footer/>
            <SignUpModal
                open={modalOpen}
                onOpenChange={lambda v: any  -> None { handleModalChange(v);}}
            />
        </div>;
}
