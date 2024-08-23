"use client";

import React, { useState } from "react";
import BoxControlPanel from "@/features/ux/Pannel";
import { BoxProps } from "@/lib/types"; // Assurez-vous que le chemin d'importation est correct

function TestPage() {
  const [background, setBackground] = useState<BoxProps>({
    balise: "div",
    children: "Hello World",
  });

  const handleBackgroundChange = (newBackground: BoxProps) => {
    setBackground(newBackground);
    console.log("Background updated:", newBackground);
  };

  return (
    <div className="p-4">
      <h1 className="text-2xl font-bold mb-4">Background Control Panel Test</h1>
      <BoxControlPanel
        boxProps={background}
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
