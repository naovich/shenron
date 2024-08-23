import React, { useState } from "react";
import {
  BackgroundProps,
  BorderProps,
  GradientProps,
  RingProps,
  OutlineProps,
} from "@/lib/types";
import { ChevronDown, ChevronUp } from "lucide-react";
import {
  Select,
  SelectContent,
  SelectGroup,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Slider } from "@/components/ui/slider";
import { Input } from "@/components/ui/input";
import ColorPicker from "@/components/ui/colorPicker";

interface BackgroundControlPanelProps {
  background: BackgroundProps;
  onChange: (background: BackgroundProps) => void;
}

const BackgroundControlPanel: React.FC<BackgroundControlPanelProps> = ({
  background,
  onChange,
}) => {
  const [expandedSections, setExpandedSections] = useState({
    main: true,
    gradient: false,
    border: false,
    ring: false,
    outline: false,
  });

  const toggleSection = (section: keyof typeof expandedSections) => {
    setExpandedSections((prev) => ({ ...prev, [section]: !prev[section] }));
  };

  const updateBackground = (key: keyof BackgroundProps, value: any) => {
    onChange({ ...background, [key]: value });
  };

  const Section: React.FC<{
    title: string;
    expanded: boolean;
    onToggle: () => void;
    children: React.ReactNode;
  }> = ({ title, expanded, onToggle, children }) => (
    <div className="mb-4 border rounded-lg overflow-hidden">
      <button
        className="w-full p-3 bg-gray-100 text-left font-semibold flex justify-between items-center"
        onClick={onToggle}
      >
        {title}
        {expanded ? <ChevronUp size={20} /> : <ChevronDown size={20} />}
      </button>
      {expanded && <div className="p-4">{children}</div>}
    </div>
  );

  return (
    <div className="bg-white p-6 rounded-xl shadow-lg max-w-2xl mx-auto">
      <h2 className="text-2xl font-bold mb-6 text-center">
        Background Control Panel
      </h2>

      <Section
        title="Main Background Properties"
        expanded={expandedSections.main}
        onToggle={() => toggleSection("main")}
      >
        <div className="space-y-4">
          <div>
            <label className="block mb-2 font-medium">Color</label>
            <ColorPicker
              color={background.color || "#ffffff"}
              onChange={(color) => updateBackground("color", color)}
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">Opacity</label>
            <Slider
              value={[background.opacity || 100]}
              onValueChange={(value) => updateBackground("opacity", value[0])}
              min={0}
              max={100}
              step={1}
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">Image URL</label>
            <Input
              value={background.image || ""}
              onChange={(e) => updateBackground("image", e.target.value)}
              placeholder="Enter image URL"
              className="w-full"
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">Attachment</label>
            <Select
              defaultValue={background.attachment || "scroll"}
              onValueChange={(value) => updateBackground("attachment", value)}
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Select attachment" />
              </SelectTrigger>
              <SelectContent>
                <SelectGroup>
                  <SelectItem value="scroll">Scroll</SelectItem>
                  <SelectItem value="fixed">Fixed</SelectItem>
                  <SelectItem value="local">Local</SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>
          </div>
          <div>
            <label className="block mb-2 font-medium">Size</label>
            <Select
              defaultValue={background.backgroundSize || "auto"}
              onValueChange={(value) =>
                updateBackground("backgroundSize", value)
              }
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Select size" />
              </SelectTrigger>
              <SelectContent>
                <SelectGroup>
                  <SelectItem value="auto">Auto</SelectItem>
                  <SelectItem value="cover">Cover</SelectItem>
                  <SelectItem value="contain">Contain</SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>
          </div>
        </div>
      </Section>

      <Section
        title="Gradient"
        expanded={expandedSections.gradient}
        onToggle={() => toggleSection("gradient")}
      >
        <div className="space-y-4">
          <div>
            <label className="block mb-2 font-medium">From Color</label>
            <ColorPicker
              color={background.gradient?.from || "#ffffff"}
              onChange={(color) =>
                updateBackground("gradient", {
                  ...background.gradient,
                  from: color,
                })
              }
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">To Color</label>
            <ColorPicker
              color={background.gradient?.to || "#000000"}
              onChange={(color) =>
                updateBackground("gradient", {
                  ...background.gradient,
                  to: color,
                })
              }
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">Direction</label>
            <Select
              defaultValue={background.gradient?.direction || "right"}
              onValueChange={(value) =>
                updateBackground("gradient", {
                  ...background.gradient,
                  direction: value,
                })
              }
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Select direction" />
              </SelectTrigger>
              <SelectContent>
                <SelectGroup>
                  <SelectItem value="top">Top</SelectItem>
                  <SelectItem value="right">Right</SelectItem>
                  <SelectItem value="bottom">Bottom</SelectItem>
                  <SelectItem value="left">Left</SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>
          </div>
          <div>
            <label className="block mb-2 font-medium">Type</label>
            <Select
              defaultValue={background.gradient?.type || "linear"}
              onValueChange={(value) =>
                updateBackground("gradient", {
                  ...background.gradient,
                  type: value,
                })
              }
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Select type" />
              </SelectTrigger>
              <SelectContent>
                <SelectGroup>
                  <SelectItem value="linear">Linear</SelectItem>
                  <SelectItem value="radial">Radial</SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>
          </div>
        </div>
      </Section>

      <Section
        title="Border"
        expanded={expandedSections.border}
        onToggle={() => toggleSection("border")}
      >
        <div className="space-y-4">
          <div>
            <label className="block mb-2 font-medium">Color</label>
            <ColorPicker
              color={background.border?.color || "#000000"}
              onChange={(color) =>
                updateBackground("border", { ...background.border, color })
              }
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">Width</label>
            <Input
              type="number"
              value={background.border?.width || ""}
              onChange={(e) =>
                updateBackground("border", {
                  ...background.border,
                  width: parseInt(e.target.value),
                })
              }
              className="w-full"
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">Style</label>
            <Select
              defaultValue={background.border?.style || "solid"}
              onValueChange={(value) =>
                updateBackground("border", {
                  ...background.border,
                  style: value,
                })
              }
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Select style" />
              </SelectTrigger>
              <SelectContent>
                <SelectGroup>
                  <SelectItem value="solid">Solid</SelectItem>
                  <SelectItem value="dashed">Dashed</SelectItem>
                  <SelectItem value="dotted">Dotted</SelectItem>
                  <SelectItem value="double">Double</SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>
          </div>
          <div>
            <label className="block mb-2 font-medium">Radius</label>
            <Input
              type="number"
              value={background.border?.radius || ""}
              onChange={(e) =>
                updateBackground("border", {
                  ...background.border,
                  radius: parseInt(e.target.value),
                })
              }
              className="w-full"
            />
          </div>
        </div>
      </Section>
    </div>
  );
};

export default BackgroundControlPanel;
