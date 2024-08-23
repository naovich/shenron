import React, { useCallback, useEffect, useState } from "react";
import {
  BoxProps,
  BackgroundProps,
  CoordProps,
  BorderProps,
  BorderStyleProps,
  BlendModeProps,
  PositionProps,
  BaliseProps,
  DisplayProps,
  VisibilityProps,
  CursorProps,
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
import { Switch } from "@/components/ui/switch";
import ColorPicker from "@/components/ui/colorPicker";

interface BoxControlPanelProps {
  boxProps: BoxProps;
  onChange: (boxProps: BoxProps) => void;
}

const BoxControlPanel: React.FC<BoxControlPanelProps> = ({
  boxProps,
  onChange,
}) => {
  const [expandedSections, setExpandedSections] = useState({
    balise: true,
    baliseLayout: true,
    position: false,
    padding: false,
    margin: false,
    layout: false,
    space: false,
    background: false,
    border: false,
    gradient: false,
    size: false,
    arrangement: false,
    hover: false,
    divider: false,
    overflow: false,
    ring: false,
    outline: false,
    clipOrigin: false,
    blendModes: false,
    transform: false,
  });

  const toggleSection = (section: keyof typeof expandedSections) => {
    setExpandedSections((prev) => ({ ...prev, [section]: !prev[section] }));
  };

  const updateBoxProps = useCallback(
    (key: keyof BoxProps, value: any) => {
      onChange({ ...boxProps, [key]: value });
    },
    [boxProps, onChange]
  );

  const [useCustomBackgroundPosition, setUseCustomBackgroundPosition] =
    useState(false);
  const [customBackgroundPosition, setCustomBackgroundPosition] =
    useState<CoordProps>({
      x: "",
      y: "",
    });

  useEffect(() => {
    if (
      boxProps.background &&
      typeof boxProps.background.backgroundPosition === "object"
    ) {
      setCustomBackgroundPosition(boxProps.background.backgroundPosition);
      setUseCustomBackgroundPosition(true);
    } else {
      setUseCustomBackgroundPosition(false);
    }
  }, [boxProps.background, boxProps.background?.backgroundPosition]);

  const handleCustomBackgroundPositionChange = useCallback(
    (axis: "x" | "y", value: string) => {
      const newPosition = { ...customBackgroundPosition, [axis]: value };
      setCustomBackgroundPosition(newPosition);
      updateBoxProps("background", {
        ...boxProps.background,
        backgroundPosition: newPosition,
      });
    },
    [customBackgroundPosition, boxProps.background, updateBoxProps]
  );

  const updateBaliseProps = (key: keyof BaliseProps, value: any) => {
    onChange({
      ...boxProps,
      [key]: value,
    });
  };

  const getOriginValue = (origin: string | CoordProps | undefined): string => {
    if (typeof origin === "string") {
      return origin;
    } else if (typeof origin === "object" && origin !== null) {
      return `${origin.x || ""} ${origin.y || ""}`.trim();
    }
    return "";
  };

  const setOriginValue = (value: string): string | CoordProps => {
    const parts = value.split(" ");
    if (parts.length === 1) {
      return value; // C'est une valeur simple comme "center"
    } else if (parts.length === 2) {
      return { x: parts[0], y: parts[1] }; // C'est une coordonnée
    }
    return value; // Par défaut, on retourne la valeur telle quelle
  };

  const updateSpaceProps = (key: "width" | "direction", value: string) => {
    const updatedSpace = boxProps.space ? { ...boxProps.space } : {};
    if (key === "width") {
      updatedSpace.width = value;
    } else if (key === "direction") {
      updatedSpace.direction = value as "x" | "y";
    }
    updateBoxProps("space", updatedSpace);
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
      <h2 className="text-2xl font-bold mb-6 text-center">Control Panel</h2>
      {/*------------- LAYOUT ------------- */}
      <Section
        title="Layout"
        expanded={expandedSections.layout}
        onToggle={() => toggleSection("layout")}
      >
        <div className="space-y-4">
          <div>
            <label className="block mb-2 font-medium">Balise</label>
            <Select
              value={boxProps.balise || "div"}
              onValueChange={(value) =>
                updateBoxProps("balise", value as BoxProps["balise"])
              }
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Select balise" />
              </SelectTrigger>
              <SelectContent>
                <SelectGroup>
                  <SelectItem value="page">Page</SelectItem>
                  <SelectItem value="body">Body</SelectItem>
                  <SelectItem value="main">Main</SelectItem>
                  <SelectItem value="div">Div</SelectItem>
                  <SelectItem value="section">Section</SelectItem>
                  <SelectItem value="article">Article</SelectItem>
                  <SelectItem value="aside">Aside</SelectItem>
                  <SelectItem value="header">Header</SelectItem>
                  <SelectItem value="footer">Footer</SelectItem>
                  <SelectItem value="nav">Nav</SelectItem>
                  <SelectItem value="form">Form</SelectItem>
                  <SelectItem value="details">Details</SelectItem>
                  <SelectItem value="figure">Figure</SelectItem>
                  <SelectItem value="summary">Summary</SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>
          </div>
          <div>
            <label className="block mb-2 font-medium">Layout</label>
            <Select
              value={boxProps.layout || "block"}
              onValueChange={(value) =>
                updateBoxProps("layout", value as BoxProps["layout"])
              }
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Select layout" />
              </SelectTrigger>
              <SelectContent>
                <SelectGroup>
                  <SelectItem value="flex-row">Flex Row</SelectItem>
                  <SelectItem value="flex-row-reverse">
                    Flex Row Reverse
                  </SelectItem>
                  <SelectItem value="flex-col">Flex Column</SelectItem>
                  <SelectItem value="flex-col-reverse">
                    Flex Column Reverse
                  </SelectItem>
                  <SelectItem value="grid">Grid</SelectItem>
                  <SelectItem value="block">Block</SelectItem>
                  <SelectItem value="inline">Inline</SelectItem>
                  <SelectItem value="inline-block">Inline Block</SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>
          </div>
          <div>
            <label className="block mb-2 font-medium">Size</label>
            <div className="grid grid-cols-2 gap-4">
              <Input
                type="text"
                placeholder="Width"
                value={boxProps.size?.width || ""}
                onChange={(e) =>
                  updateBoxProps("size", {
                    ...boxProps.size,
                    width: e.target.value,
                  })
                }
              />
              <Input
                type="text"
                placeholder="Height"
                value={boxProps.size?.height || ""}
                onChange={(e) =>
                  updateBoxProps("size", {
                    ...boxProps.size,
                    height: e.target.value,
                  })
                }
              />
              <Input
                type="text"
                placeholder="Max Width"
                value={boxProps.size?.maxWidth || ""}
                onChange={(e) =>
                  updateBoxProps("size", {
                    ...boxProps.size,
                    maxWidth: e.target.value,
                  })
                }
              />
              <Input
                type="text"
                placeholder="Max Height"
                value={boxProps.size?.maxHeight || ""}
                onChange={(e) =>
                  updateBoxProps("size", {
                    ...boxProps.size,
                    maxHeight: e.target.value,
                  })
                }
              />
              <Input
                type="text"
                placeholder="Min Width"
                value={boxProps.size?.minWidth || ""}
                onChange={(e) =>
                  updateBoxProps("size", {
                    ...boxProps.size,
                    minWidth: e.target.value,
                  })
                }
              />
              <Input
                type="text"
                placeholder="Min Height"
                value={boxProps.size?.minHeight || ""}
                onChange={(e) =>
                  updateBoxProps("size", {
                    ...boxProps.size,
                    minHeight: e.target.value,
                  })
                }
              />
            </div>
          </div>

          <div>
            <label className="block mb-2 font-medium">Position</label>
            <Select
              value={boxProps.position || "static"}
              onValueChange={(value) =>
                updateBaliseProps("position", value as PositionProps)
              }
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Select position" />
              </SelectTrigger>
              <SelectContent>
                <SelectGroup>
                  <SelectItem value="static">Static</SelectItem>
                  <SelectItem value="relative">Relative</SelectItem>
                  <SelectItem value="absolute">Absolute</SelectItem>
                  <SelectItem value="fixed">Fixed</SelectItem>
                  <SelectItem value="sticky">Sticky</SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>
          </div>
          <div>
            <label className="block mb-2 font-medium">Position</label>
            <div className="grid grid-cols-2 gap-4">
              <Input
                type="text"
                placeholder="X (e.g., 10px, 50%)"
                value={boxProps.coord?.x || ""}
                onChange={(e) =>
                  updateBaliseProps("coord", {
                    ...boxProps.coord,
                    x: e.target.value,
                  })
                }
              />
              <Input
                type="text"
                placeholder="Y (e.g., 10px, 50%)"
                value={boxProps.coord?.y || ""}
                onChange={(e) =>
                  updateBaliseProps("coord", {
                    ...boxProps.coord,
                    y: e.target.value,
                  })
                }
              />
            </div>
          </div>

          <div>
            <label className="block mb-2 font-medium">Opacity</label>
            <Slider
              value={[
                typeof boxProps.opacity === "number"
                  ? boxProps.opacity * 100
                  : 100,
              ]}
              onValueChange={(value) =>
                updateBaliseProps("opacity", value[0] / 100)
              }
              min={0}
              max={100}
              step={1}
            />
          </div>

          <div>
            <label className="block mb-2 font-medium">Visibility</label>
            <Select
              value={boxProps.visibility || "visible"}
              onValueChange={(value) =>
                updateBaliseProps("visibility", value as VisibilityProps)
              }
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Select visibility" />
              </SelectTrigger>
              <SelectContent>
                <SelectGroup>
                  <SelectItem value="visible">Visible</SelectItem>
                  <SelectItem value="hidden">Hidden</SelectItem>
                  <SelectItem value="collapse">Collapse</SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>
          </div>
          <div>
            <label className="block mb-2 font-medium">Overflow</label>
            <Select
              value={boxProps.overflow || "visible"}
              onValueChange={(value) =>
                updateBoxProps(
                  "overflow",
                  value as "visible" | "hidden" | "scroll" | "auto"
                )
              }
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Select overflow" />
              </SelectTrigger>
              <SelectContent>
                <SelectGroup>
                  <SelectItem value="visible">Visible</SelectItem>
                  <SelectItem value="hidden">Hidden</SelectItem>
                  <SelectItem value="scroll">Scroll</SelectItem>
                  <SelectItem value="auto">Auto</SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>
          </div>

          <div>
            <label className="block mb-2 font-medium">Z-Index</label>
            <Input
              type="number"
              value={boxProps.zIndex || ""}
              onChange={(e) => updateBaliseProps("zIndex", e.target.value)}
              placeholder="Enter z-index"
            />
          </div>

          <div>
            <label className="block mb-2 font-medium">Cursor</label>
            <Select
              value={boxProps.cursor || "auto"}
              onValueChange={(value) =>
                updateBaliseProps("cursor", value as CursorProps)
              }
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Select cursor" />
              </SelectTrigger>
              <SelectContent>
                <SelectGroup>
                  <SelectItem value="auto">Auto</SelectItem>
                  <SelectItem value="default">Default</SelectItem>
                  <SelectItem value="pointer">Pointer</SelectItem>
                  <SelectItem value="wait">Wait</SelectItem>
                  <SelectItem value="text">Text</SelectItem>
                  <SelectItem value="move">Move</SelectItem>
                  <SelectItem value="help">Help</SelectItem>
                  <SelectItem value="not-allowed">Not Allowed</SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>
          </div>

          <div className="flex items-center">
            <Switch
              checked={boxProps.srOnly || false}
              onCheckedChange={(checked) =>
                updateBaliseProps("srOnly", checked)
              }
            />
            <label className="ml-2">Screen Reader Only</label>
          </div>
        </div>
      </Section>
      {/*------------- SPACE ------------- */}
      <Section
        title="Space"
        expanded={expandedSections.space}
        onToggle={() => toggleSection("space")}
      >
        <div className="space-y-4">
          <div>
            <label className="block mb-2 font-medium">Width</label>
            <Input
              type="text"
              placeholder="Width"
              value={boxProps.space?.width || ""}
              onChange={(e) => updateSpaceProps("width", e.target.value)}
              className="w-full"
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">Direction</label>
            <Select
              value={boxProps.space?.direction || "y"}
              onValueChange={(value) =>
                updateSpaceProps("direction", value as "x" | "y")
              }
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Select direction" />
              </SelectTrigger>
              <SelectContent>
                <SelectGroup>
                  <SelectItem value="x">X</SelectItem>
                  <SelectItem value="y">Y</SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>
          </div>
          <div>
            <label className="block mb-2 font-medium">Divider</label>
            <div className="space-y-4">
              <Select
                value={boxProps.divider?.direction || "horizontal"}
                onValueChange={(value) =>
                  updateBoxProps("divider", {
                    ...boxProps.divider,
                    direction: value as "horizontal" | "vertical",
                  })
                }
              >
                <SelectTrigger className="w-full">
                  <SelectValue placeholder="Select direction" />
                </SelectTrigger>
                <SelectContent>
                  <SelectGroup>
                    <SelectItem value="horizontal">Horizontal</SelectItem>
                    <SelectItem value="vertical">Vertical</SelectItem>
                  </SelectGroup>
                </SelectContent>
              </Select>
              <ColorPicker
                color={boxProps.divider?.color || "#000000"}
                onChange={(color) =>
                  updateBoxProps("divider", { ...boxProps.divider, color })
                }
              />
              <Input
                type="text"
                placeholder="Width"
                value={boxProps.divider?.width || ""}
                onChange={(e) =>
                  updateBoxProps("divider", {
                    ...boxProps.divider,
                    width: e.target.value,
                  })
                }
                className="mt-2"
              />
              <div className="mt-2">
                <Select
                  value={boxProps.divider?.style || "solid"}
                  onValueChange={(value) =>
                    updateBoxProps("divider", {
                      ...boxProps.divider,
                      style: value as BorderStyleProps,
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
              <label className="block mb-2 font-medium">Divider Opacity</label>
              <Slider
                value={[boxProps.divider?.opacity || 100]}
                onValueChange={(value) =>
                  updateBoxProps("divider", {
                    ...boxProps.divider,
                    opacity: value[0],
                  })
                }
                min={0}
                max={100}
                step={1}
                className="mt-2"
              />
              <div className="flex items-center mt-2">
                <Switch
                  checked={boxProps.divider?.reverse || false}
                  onCheckedChange={(checked) =>
                    updateBoxProps("divider", {
                      ...boxProps.divider,
                      reverse: checked,
                    })
                  }
                />
                <label className="ml-2">Reverse</label>
              </div>
            </div>
          </div>
        </div>
      </Section>
      {/*------------- MARGIN ------------- */}
      <Section
        title="Margin"
        expanded={expandedSections.margin}
        onToggle={() => toggleSection("margin")}
      >
        <div className="space-y-4">
          <Input
            type="text"
            value={boxProps.margin?.margin || ""}
            onChange={(e) =>
              updateBoxProps("margin", {
                ...boxProps.margin,
                margin: e.target.value,
              })
            }
            placeholder="Enter margin"
            className="w-full"
          />
          <Input
            type="text"
            value={boxProps.margin?.marginTop || ""}
            onChange={(e) =>
              updateBoxProps("margin", {
                ...boxProps.margin,
                marginTop: e.target.value,
              })
            }
            placeholder="Enter margin top"
            className="w-full"
          />
          <Input
            type="text"
            value={boxProps.margin?.marginBottom || ""}
            onChange={(e) =>
              updateBoxProps("margin", {
                ...boxProps.margin,
                marginBottom: e.target.value,
              })
            }
            placeholder="Enter margin bottom"
            className="w-full"
          />
          <Input
            type="text"
            value={boxProps.margin?.marginLeft || ""}
            onChange={(e) =>
              updateBoxProps("margin", {
                ...boxProps.margin,
                marginLeft: e.target.value,
              })
            }
            placeholder="Enter margin left"
            className="w-full"
          />
          <Input
            type="text"
            value={boxProps.margin?.marginRight || ""}
            onChange={(e) =>
              updateBoxProps("margin", {
                ...boxProps.margin,
                marginRight: e.target.value,
              })
            }
            placeholder="Enter margin right"
            className="w-full"
          />
        </div>
      </Section>
      {/*------------- PADDING ------------- */}
      <Section
        title="Padding"
        expanded={expandedSections.padding}
        onToggle={() => toggleSection("padding")}
      >
        <div className="space-y-4">
          <Input
            type="text"
            value={boxProps.padding?.padding || ""}
            onChange={(e) =>
              updateBoxProps("padding", {
                ...boxProps.padding,
                padding: e.target.value,
              })
            }
            placeholder="Enter padding"
            className="w-full"
          />
          <Input
            type="text"
            value={boxProps.padding?.paddingTop || ""}
            onChange={(e) =>
              updateBoxProps("padding", {
                ...boxProps.padding,
                paddingTop: e.target.value,
              })
            }
            placeholder="Enter padding top"
            className="w-full"
          />
          <Input
            type="text"
            value={boxProps.padding?.paddingBottom || ""}
            onChange={(e) =>
              updateBoxProps("padding", {
                ...boxProps.padding,
                paddingBottom: e.target.value,
              })
            }
            placeholder="Enter padding bottom"
            className="w-full"
          />
          <Input
            type="text"
            value={boxProps.padding?.paddingLeft || ""}
            onChange={(e) =>
              updateBoxProps("padding", {
                ...boxProps.padding,
                paddingLeft: e.target.value,
              })
            }
            placeholder="Enter padding left"
            className="w-full"
          />
          <Input
            type="text"
            value={boxProps.padding?.paddingRight || ""}
            onChange={(e) =>
              updateBoxProps("padding", {
                ...boxProps.padding,
                paddingRight: e.target.value,
              })
            }
            placeholder="Enter padding right"
            className="w-full"
          />
        </div>
      </Section>
      {/*------------- BACKGROUND ------------- */}
      <Section
        title="Background"
        expanded={expandedSections.background}
        onToggle={() => toggleSection("background")}
      >
        <div className="space-y-4">
          <div>
            <label className="block mb-2 font-medium">Color</label>
            <ColorPicker
              color={boxProps.background?.color || "#ffffff"}
              onChange={(color) =>
                updateBoxProps("background", { ...boxProps.background, color })
              }
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">Opacity</label>
            <Slider
              value={[boxProps.background?.opacity || 100]}
              onValueChange={(value) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  opacity: value[0],
                })
              }
              min={0}
              max={100}
              step={1}
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">Image URL</label>
            <Input
              value={boxProps.background?.image || ""}
              onChange={(e) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  image: e.target.value,
                })
              }
              placeholder="Enter image URL"
              className="w-full"
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">Attachment</label>
            <Select
              value={boxProps.background?.attachment || "scroll"}
              onValueChange={(value) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  attachment: value,
                })
              }
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
            <label className="block mb-2 font-medium">Background size</label>
            <Select
              value={boxProps.background?.backgroundSize || "auto"}
              onValueChange={(value) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  backgroundSize: value,
                })
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

          <div>
            <label className="block mb-2 font-medium">
              Background Position
            </label>
            <div className="flex items-center mb-2">
              <Switch
                checked={useCustomBackgroundPosition}
                onCheckedChange={setUseCustomBackgroundPosition}
              />
              <span className="ml-2">Use custom position</span>
            </div>
            {useCustomBackgroundPosition ? (
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="block mb-1">X</label>
                  <Input
                    type="text"
                    value={customBackgroundPosition.x}
                    onChange={(e) =>
                      handleCustomBackgroundPositionChange("x", e.target.value)
                    }
                    placeholder="e.g., 10px or 50%"
                  />
                </div>
                <div>
                  <label className="block mb-1">Y</label>
                  <Input
                    type="text"
                    value={customBackgroundPosition.y}
                    onChange={(e) =>
                      handleCustomBackgroundPositionChange("y", e.target.value)
                    }
                    placeholder="e.g., 10px or 50%"
                  />
                </div>
              </div>
            ) : (
              <Select
                value={
                  typeof boxProps.background?.backgroundPosition === "string"
                    ? boxProps.background.backgroundPosition
                    : "center"
                }
                onValueChange={(value) =>
                  updateBoxProps("background", {
                    ...boxProps.background,
                    backgroundPosition: value,
                  })
                }
              >
                <SelectTrigger className="w-full">
                  <SelectValue placeholder="Select position" />
                </SelectTrigger>
                <SelectContent>
                  <SelectGroup>
                    <SelectItem value="center">Center</SelectItem>
                    <SelectItem value="top">Top</SelectItem>
                    <SelectItem value="bottom">Bottom</SelectItem>
                    <SelectItem value="left">Left</SelectItem>
                    <SelectItem value="right">Right</SelectItem>
                    <SelectItem value="top left">Top Left</SelectItem>
                    <SelectItem value="top right">Top Right</SelectItem>
                    <SelectItem value="bottom left">Bottom Left</SelectItem>
                    <SelectItem value="bottom right">Bottom Right</SelectItem>
                  </SelectGroup>
                </SelectContent>
              </Select>
            )}
          </div>
          <div className="space-y-4">
            <div>
              <label className="block mb-2 font-medium">Gradient</label>

              <label className="block mb-2 font-medium">From Color</label>
              <ColorPicker
                color={boxProps.background?.gradient?.from || "#ffffff"}
                onChange={(color) =>
                  updateBoxProps("background", {
                    ...boxProps.background,
                    gradient: {
                      ...boxProps.background?.gradient,
                      from: color,
                    },
                  })
                }
              />
            </div>
            <div>
              <label className="block mb-2 font-medium">To Color</label>
              <ColorPicker
                color={boxProps.background?.gradient?.to || "#000000"}
                onChange={(color) =>
                  updateBoxProps("background", {
                    ...boxProps.background,
                    gradient: {
                      ...boxProps.background?.gradient,
                      to: color,
                    },
                  })
                }
              />
            </div>
            <div>
              <label className="block mb-2 font-medium">Direction</label>
              <Select
                value={boxProps.background?.gradient?.direction || "right"}
                onValueChange={(value) =>
                  updateBoxProps("background", {
                    ...boxProps.background,
                    gradient: {
                      ...boxProps.background?.gradient,
                      direction: value,
                    },
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
                value={boxProps.background?.gradient?.type || "linear"}
                onValueChange={(value) =>
                  updateBoxProps("background", {
                    ...boxProps.background,
                    gradient: {
                      ...boxProps.background?.gradient,
                      type: value,
                    },
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
        </div>
      </Section>
      {/*------------- GRADIENT ------------- */}

      {/*------------- BORDER ------------- */}
      <Section
        title="Border"
        expanded={expandedSections.border}
        onToggle={() => toggleSection("border")}
      >
        <div className="space-y-4">
          <div>
            <label className="block mb-2 font-medium">Color</label>
            <ColorPicker
              color={boxProps.background?.border?.color || "#000000"}
              onChange={(color) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  border: {
                    ...boxProps.background?.border,
                    color,
                  },
                })
              }
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">Width</label>
            <Input
              type="number"
              value={boxProps.background?.border?.width || ""}
              onChange={(e) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  border: {
                    ...boxProps.background?.border,
                    width: parseInt(e.target.value),
                  },
                })
              }
              className="w-full"
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">Style</label>
            <Select
              value={boxProps.background?.border?.style || "solid"}
              onValueChange={(value) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  border: {
                    ...boxProps.background?.border,
                    style: value as BorderStyleProps,
                  },
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
              value={boxProps.background?.border?.radius || ""}
              onChange={(e) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  border: {
                    ...boxProps.background?.border,
                    radius: parseInt(e.target.value),
                  },
                })
              }
              className="w-full"
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">Side</label>
            <Select
              value={boxProps.background?.border?.side || "all"}
              onValueChange={(value) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  border: {
                    ...boxProps.background?.border,
                    side: value as BorderProps["side"],
                  },
                })
              }
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Select side" />
              </SelectTrigger>
              <SelectContent>
                <SelectGroup>
                  <SelectItem value="all">All</SelectItem>
                  <SelectItem value="top">Top</SelectItem>
                  <SelectItem value="bottom">Bottom</SelectItem>
                  <SelectItem value="left">Left</SelectItem>
                  <SelectItem value="right">Right</SelectItem>
                  <SelectItem value="top-bottom">Top-Bottom</SelectItem>
                  <SelectItem value="left-right">Left-Right</SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>
          </div>
        </div>
      </Section>
      {/*------------- RING ------------- */}
      <Section
        title="Ring"
        expanded={expandedSections.ring}
        onToggle={() => toggleSection("ring")}
      >
        <div className="space-y-4">
          <div>
            <label className="block mb-2 font-medium">Color</label>
            <ColorPicker
              color={boxProps.background?.ring?.color || "#000000"}
              onChange={(color) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  ring: {
                    ...boxProps.background?.ring,
                    color,
                  },
                })
              }
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">Offset Color</label>
            <ColorPicker
              color={boxProps.background?.ring?.offsetColor || "#ffffff"}
              onChange={(color) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  ring: {
                    ...boxProps.background?.ring,
                    offsetColor: color,
                  },
                })
              }
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">Width</label>
            <Input
              type="number"
              value={boxProps.background?.ring?.width || ""}
              onChange={(e) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  ring: {
                    ...boxProps.background?.ring,
                    width: parseInt(e.target.value),
                  },
                })
              }
              className="w-full"
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">Offset Width</label>
            <Input
              type="number"
              value={boxProps.background?.ring?.offsetWidth || ""}
              onChange={(e) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  ring: {
                    ...boxProps.background?.ring,
                    offsetWidth: e.target.value,
                  },
                })
              }
              className="w-full"
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">Opacity</label>
            <Slider
              value={[boxProps.background?.ring?.opacity || 100]}
              onValueChange={(value) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  ring: {
                    ...boxProps.background?.ring,
                    opacity: value[0],
                  },
                })
              }
              min={0}
              max={100}
              step={1}
            />
          </div>
          <div className="flex items-center">
            <Switch
              checked={boxProps.background?.ring?.inset || false}
              onCheckedChange={(checked) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  ring: {
                    ...boxProps.background?.ring,
                    inset: checked,
                  },
                })
              }
            />

            <label className="ml-2">Inset</label>
          </div>
        </div>
      </Section>
      {/*------------- OUTLINE ------------- */}
      <Section
        title="Outline"
        expanded={expandedSections.outline}
        onToggle={() => toggleSection("outline")}
      >
        <div className="space-y-4">
          <div>
            <label className="block mb-2 font-medium">Color</label>
            <ColorPicker
              color={boxProps.background?.outline?.color || "#000000"}
              onChange={(color) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  outline: {
                    ...boxProps.background?.outline,
                    color,
                  },
                })
              }
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">Width</label>
            <Input
              type="number"
              value={boxProps.background?.outline?.width || ""}
              onChange={(e) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  outline: {
                    ...boxProps.background?.outline,
                    width: parseInt(e.target.value),
                  },
                })
              }
              className="w-full"
            />
          </div>
          <div>
            <label className="block mb-2 font-medium">Style</label>
            <Select
              value={boxProps.background?.outline?.style || "solid"}
              onValueChange={(value) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  outline: {
                    ...boxProps.background?.outline,
                    style: value as BorderStyleProps,
                  },
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
            <label className="block mb-2 font-medium">Offset</label>
            <Input
              type="number"
              value={boxProps.background?.outline?.offset || ""}
              onChange={(e) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  outline: {
                    ...boxProps.background?.outline,
                    offset: parseInt(e.target.value),
                  },
                })
              }
              className="w-full"
            />
          </div>
        </div>
      </Section>
      {/*------------- CLIP/ORIGIN ------------- */}
      <Section
        title="Clip and Origin"
        expanded={expandedSections.clipOrigin}
        onToggle={() => toggleSection("clipOrigin")}
      >
        <div className="space-y-4">
          <div>
            <label className="block mb-2 font-medium">Clip</label>
            <Select
              value={boxProps.background?.clip || "border-box"}
              onValueChange={(value) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  clip: value as BackgroundProps["clip"],
                })
              }
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Select clip" />
              </SelectTrigger>
              <SelectContent>
                <SelectGroup>
                  <SelectItem value="border-box">Border Box</SelectItem>
                  <SelectItem value="padding-box">Padding Box</SelectItem>
                  <SelectItem value="content-box">Content Box</SelectItem>
                  <SelectItem value="text">Text</SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>
          </div>
          <div>
            <label className="block mb-2 font-medium">Origin</label>
            <Select
              value={boxProps.background?.clip || "border-box"}
              onValueChange={(value) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  clip: value as BackgroundProps["clip"],
                })
              }
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Select clip" />
              </SelectTrigger>
              <SelectContent>
                <SelectGroup>
                  <SelectItem value="border-box">Border Box</SelectItem>
                  <SelectItem value="padding-box">Padding Box</SelectItem>
                  <SelectItem value="content-box">Content Box</SelectItem>
                  <SelectItem value="text">Text</SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>
          </div>
        </div>
      </Section>
      {/*------------- BLEND MODES ------------- */}
      <Section
        title="Blend Modes"
        expanded={expandedSections.blendModes}
        onToggle={() => toggleSection("blendModes")}
      >
        <div className="space-y-4">
          <div>
            <label className="block mb-2 font-medium">
              Background Blend Mode
            </label>
            <Select
              value={boxProps.background?.backgroundBlendMode || "normal"}
              onValueChange={(value) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  backgroundBlendMode: value as BlendModeProps,
                })
              }
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Select blend mode" />
              </SelectTrigger>
              <SelectContent>
                <SelectGroup>
                  <SelectItem value="normal">Normal</SelectItem>
                  <SelectItem value="multiply">Multiply</SelectItem>
                  <SelectItem value="screen">Screen</SelectItem>
                  <SelectItem value="overlay">Overlay</SelectItem>
                  <SelectItem value="darken">Darken</SelectItem>
                  <SelectItem value="lighten">Lighten</SelectItem>
                  <SelectItem value="color-dodge">Color Dodge</SelectItem>
                  <SelectItem value="color-burn">Color Burn</SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>
          </div>
          <div>
            <label className="block mb-2 font-medium">Mix Blend Mode</label>
            <Select
              value={boxProps.background?.mixBlendMode || "normal"}
              onValueChange={(value) =>
                updateBoxProps("background", {
                  ...boxProps.background,
                  mixBlendMode: value as BlendModeProps,
                })
              }
            >
              <SelectTrigger className="w-full">
                <SelectValue placeholder="Select blend mode" />
              </SelectTrigger>
              <SelectContent>
                <SelectGroup>
                  <SelectItem value="normal">Normal</SelectItem>
                  <SelectItem value="multiply">Multiply</SelectItem>
                  <SelectItem value="screen">Screen</SelectItem>
                  <SelectItem value="overlay">Overlay</SelectItem>
                  <SelectItem value="darken">Darken</SelectItem>
                  <SelectItem value="lighten">Lighten</SelectItem>
                  <SelectItem value="color-dodge">Color Dodge</SelectItem>
                  <SelectItem value="color-burn">Color Burn</SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>
          </div>
        </div>
      </Section>
      {/*------------- TRANSFORM ------------- */}
      <Section
        title="Transform"
        expanded={expandedSections.transform}
        onToggle={() => toggleSection("transform")}
      >
        <div className="space-y-4">
          {/* Transform properties */}
          <div>
            <label className="block mb-2 font-medium">Transform</label>
            <div className="space-y-2">
              <Input
                type="text"
                placeholder="Translate (e.g., 10px, 20px)"
                value={`${boxProps.transform?.translate?.x || ""}, ${
                  boxProps.transform?.translate?.y || ""
                }`}
                onChange={(e) => {
                  const [x, y] = e.target.value
                    .split(",")
                    .map((val) => val.trim());
                  updateBaliseProps("transform", {
                    ...boxProps.transform,
                    translate: { x, y },
                  });
                }}
              />
              <Input
                type="text"
                placeholder="Scale (e.g., 1.5)"
                value={boxProps.transform?.scale || ""}
                onChange={(e) =>
                  updateBaliseProps("transform", {
                    ...boxProps.transform,
                    scale: e.target.value,
                  })
                }
              />
              <Input
                type="text"
                placeholder="Rotate (e.g., 45deg)"
                value={boxProps.transform?.rotate || ""}
                onChange={(e) =>
                  updateBaliseProps("transform", {
                    ...boxProps.transform,
                    rotate: e.target.value,
                  })
                }
              />
              <Input
                type="text"
                placeholder="Skew (e.g., 10deg)"
                value={boxProps.transform?.skew || ""}
                onChange={(e) =>
                  updateBaliseProps("transform", {
                    ...boxProps.transform,
                    skew: e.target.value,
                  })
                }
              />
              <Input
                type="text"
                placeholder="Origin (e.g., center, 10px 20px)"
                value={getOriginValue(boxProps.transform?.origin)}
                onChange={(e) =>
                  updateBaliseProps("transform", {
                    ...boxProps.transform,
                    origin: setOriginValue(e.target.value),
                  })
                }
              />
            </div>
          </div>
        </div>
      </Section>
    </div>
  );
};

export default BoxControlPanel;
