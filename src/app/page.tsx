import AlertDialogCustom from "@/components/shared/AlertDialogCustom";

export default function Home() {
  const base = "flex min-h-screen flex-col items-center justify-between p-24";
  const base2 = "2xl:container mx-auto px-4 ";
  const base3 = "w-full mx-auto";

  return (
    <div className="p-4 space-y-6 divide-y-8 columns-3">
      <h2 className="text-2xl font-bold mb-4">
        Exemples de ring-color et ring-offset-color
      </h2>

      <RingExample
        title="1. ring-color de base"
        className="ring-8 ring-red-500"
      />

      <RingExample
        title="2. ring-offset-color de base"
        className="ring-4 ring-blue-500 ring-offset-8 ring-offset-yellow-300"
      />

      <RingExample
        title="3. Combinaison complexe"
        className="ring-4 ring-purple-500 ring-offset-4 ring-offset-green-200"
      />

      <div className="mt-8 resize ">
        <p className="text-sm text-gray-600 shadow-inner ">
          Note: Cliquez ou focalisez les boutons pour voir l'effet des anneaux.
        </p>
      </div>
      <textarea className="resize" />
    </div>
  );
}

const RingExample = ({ title, className }: any) => (
  <div className="mb-4">
    <h3 className="text-lg font-semibold mb-2">{title}</h3>
    <button
      className={`resize  px-4 py-2 bg-green-500 text-white rounded focus:outline-none ${className} before:content-['*']`}
    >
      Bouton d'exemple
    </button>
  </div>
);
