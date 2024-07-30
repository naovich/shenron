"use client";
import AlertDialogCustom from "@/components/shared/AlertDialogCustom";
import { AccordionDemo } from "@/components/ui/accotdionCustom";
import { Button } from "@/components/ui/button";
import AutoFocusButton from "@/components/ui/buttonAutofocus";
import { Checkbox } from "@/components/ui/checkbox";
import { Input } from "@/components/ui/input";
import { Select } from "@/components/ui/select";
import SelectCustom from "@/components/ui/selectCustom";
import { Check } from "lucide-react";
import { use, useState } from "react";

export default function Home() {
  const base = "flex min-h-screen flex-col items-center justify-between p-24";
  const base2 = "2xl:container mx-auto px-4 ";
  const base3 = "w-full mx-auto";

  const [className, setClassName] = useState("");

  return (
    <div className="space-y-4 ">
      <Button onClick={() => setClassName("bg-red-500")}>Button</Button>
      <Input type="email" placeholder="Email" className={className} />
      <Checkbox />
      <SelectCustom />
      <AccordionDemo />
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
