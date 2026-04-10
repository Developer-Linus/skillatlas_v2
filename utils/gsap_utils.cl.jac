import from "@gsap/react" { useGSAP as _useGSAP }
import from "gsap" { gsap as _gsap }
import from "gsap/ScrollTrigger" { ScrollTrigger as _ScrollTrigger }
import from "gsap/SplitText" { SplitText as _SplitText }

glob:pub gsap: Any = _gsap,
     SplitText: Any = _SplitText,
     useGSAP: Any = _useGSAP;

with entry {
    gsap.registerPlugin(_ScrollTrigger, _SplitText);
}
