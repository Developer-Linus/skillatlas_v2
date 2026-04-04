import from "lucide-react" { Users, BookOpen, Briefcase }

def:pub StatCard(icon: any, value: int, label: str) -> JsxElement {
    has count: int = 0;

    can with entry {
        step: int = value // 60;
        intervalId = setInterval(
            lambda -> None { count = count + step;if count >= value {
                count = value;
                clearInterval(intervalId);
            }},
            33
        );
    }

    can with exit {
        clearInterval(intervalId);
    }

    return
        <div className="flex flex-col items-center gap-3 px-6 py-8">
            <div
                className="inline-flex items-center justify-center w-14 h-14 rounded-xl bg-[#e1faf5] text-[#2dd4bf]"
            >
                {icon}
            </div>
            <p className="font-display text-4xl md:text-5xl font-bold text-[#0f2027]">
                {count.toLocaleString()}+
            </p>
            <p className="text-gray-500 text-sm font-medium tracking-wide uppercase">
                {label}
            </p>
        </div>;
}

def:pub StatsSection -> JsxElement {
    return
        <section className="relative z-10 bg-gray-50 border-y border-gray-200">
            <div className="container mx-auto px-6 py-6">
                <div
                    className="grid grid-cols-1 md:grid-cols-3 gap-2 md:divide-x md:divide-gray-200"
                >
                    <StatCard
                        icon={<Users size={28}/>}
                        value={10000}
                        label="Program Participants"
                    />
                    <StatCard
                        icon={<BookOpen size={28}/>}
                        value={250}
                        label="Expert-Led Courses"
                    />
                    <StatCard
                        icon={<Briefcase size={28}/>}
                        value={5200}
                        label="Jobs Secured"
                    />
                </div>
            </div>
        </section>;
}
