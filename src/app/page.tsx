import AlertDialogCustom from "@/components/shared/AlertDialogCustom";

export default function Home() {
  const base = "flex min-h-screen flex-col items-center justify-between p-24";
  const base2 = "2xl:container mx-auto px-4 ";
  const base3 = "w-full mx-auto";
  return (
    <main className={`${base2} bg-slate-400 `}>
      <div className="columns-4 bg-red-600">
        <p>1x</p>
        <p>2x</p>
        <p>3x</p>
        <p>4x</p>
      </div>

      <div className="columns-2">
        <p>Well, let me tell you something, ...</p>
        <p>Sure, go ahead, laugh...</p>
        <p>Maybe we can live without...</p>
        <p>Look. If you think this is...</p>
      </div>
    </main>
  );
}
