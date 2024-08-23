"use client";

import React, { useState } from "react";
import BackgroundControlPanel from "@/features/ux/Pannel";
import { BackgroundProps } from "@/lib/types"; // Assurez-vous que le chemin d'importation est correct

function TestPage() {
  const [background, setBackground] = useState<BackgroundProps>({
    color: "#ffffff",
    opacity: 100,
    image: "",
    attachment: "scroll",
    backgroundSize: "auto",
    gradient: {
      from: "#ffffff",
      to: "#000000",
      direction: "right",
      type: "linear",
    },
    border: {
      color: "#000000",
      width: 1,
      style: "solid",
      radius: 0,
    },
    // Vous pouvez ajouter d'autres propriétés initiales ici
  });

  const handleBackgroundChange = (newBackground: BackgroundProps) => {
    setBackground(newBackground);
    console.log("Background updated:", newBackground);
  };

  return (
    <div className="p-4">
      <h1 className="text-2xl font-bold mb-4">Background Control Panel Test</h1>
      <BackgroundControlPanel
        background={background}
        onChange={handleBackgroundChange}
      />
      <div className="mt-8">
        <h2 className="text-xl font-semibold mb-2">
          Current Background State:
        </h2>
        <pre className="bg-gray-100 p-4 rounded">
          {JSON.stringify(background, null, 2)}
        </pre>
      </div>
    </div>
  );
}

export default TestPage;
