/*-------------------------- BASIC  --------------------------*/

export interface GradiantProps {
  from: string;
  to: string;
  colorStart?: string;
  colorEnd?: string;
  colorMidde?: string;
  colorStartDeg?: number | string;
  colorEndDeg?: number | string;
  colorMiddeDeg?: number | string;
  direction?: "top" | "right" | "bottom" | "left";
  type?: "linear" | "radial";
}

export interface RingProps {
  color?: string;
  offset?: string;
  opacity?: number;
  width?: number | string;
  inset?: boolean;
}

export interface BackgroudProps {
  color?: string;
  image?: string;
  opacity?: number;
  position?:
    | "center"
    | "top"
    | "bottom"
    | "left"
    | "right"
    | "top left"
    | "top right"
    | "bottom left"
    | "bottom right";
  gradient?: GradiantProps;
  border?: borderProps;
  ring?: RingProps;
  shadow?: string;
  size?: "auto" | "cover" | "contain";
  repeat?: "no-repeat" | "repeat" | "repeat-x" | "repeat-y";
}

export interface borderProps {
  color?: string;
  width?: number | string;
  style?: "solid" | "dotted" | "dashed";
  radius?: number;
  side?:
    | "all"
    | "top"
    | "bottom"
    | "left"
    | "right"
    | "top-bottom"
    | "left-right";
}

export interface statusProps {
  hoverStatus?: {
    label: TextProps;
    background: BackgroudProps;
    border: borderProps;
    ring: RingProps;
    shadow: string;
  };
  disabledStatus?: {
    label: TextProps;
    background: BackgroudProps;
    border: borderProps;
    ring: RingProps;
    shadow: string;
  };
  focusStatus?: {
    label: TextProps;
    background: BackgroudProps;
    border: borderProps;
    ring: RingProps;
    shadow: string;
  };
}

export interface PaddingProps {
  padding?: number | string;
  paddingTop?: number | string;
  paddingBottom?: number | string;
  paddingLeft?: number | string;
  paddingRight?: number | string;
}

export interface MarginProps {
  margin?: number | string;
  marginTop?: number | string;
  marginBottom?: number | string;
  marginLeft?: number | string;
  marginRight?: number | string;
}

export interface SizeProps {
  width?: number | string;
  height?: number | string;
  maxWidth?: number | string;
  maxHeight?: number | string;
  minWidth?: number | string;
  minHeight?: number | string;
}

/*-------------------------- COMPONENTS  --------------------------*/

export interface TextProps {
  color?: string;
  size?: number | string;
  weight?: "light" | "normal" | "bold" | "bolder";
  align?: "left" | "center" | "right";
  transform?:
    | "capitalize"
    | "uppercase"
    | "lowercase"
    | "firstLetterCapilalize"
    | "none";
  decoration?: "line-through" | "underline" | "none";
  font?: string;
  lineHeight?: number | string;
  letterSpacing?: number | string;
  wordSpacing?: number | string;
}

export interface TypographyProps {
  type?: "h1" | "h2" | "h3" | "h4" | "h5" | "h6" | "p" | "span";
  children: React.ReactNode;
  text: TextProps;
}

export interface IconProps {
  width?: number;
  height?: number;
  color?: string;
  fill?: string;
  type: "font" | "svg" | "img";
}

export interface ButtonProps {
  label?: TextProps;
  variant?: "primary" | "secondary" | "outline";
  position: "static" | "relative" | "absolute" | "fixed";
  width?: number | string;
  height?: number | string;
  maxWidth?: number | string;
  maxHeight?: number | string;
  padding?: PaddingProps;
  background?: BackgroudProps;
  size?: SizeProps;
  icon?: IconProps;
  iconPosition?: "left" | "right" | "top" | "bottom";
  iconSpacing?: number | string;
  children: React.ReactNode;
  onClick?: () => void;
  type?: "button" | "submit" | "reset";
  disabled?: boolean;
  status?: statusProps;
}

export interface ImageProps {
  src: string;
  alt: string;
  width?: number | string;
  height?: number | string;
  border?: borderProps;
  radius?: number;
  shadow?: boolean;
}

export interface BoxProps {
  type?: "div" | "section" | "article" | "aside" | "header" | "footer";
  layout?: "flex" | "grid" | "block";
  position?: "static" | "relative" | "absolute" | "fixed" | "sticky";
  x?: number | string;
  y?: number | string;
  size?: SizeProps;
  padding?: PaddingProps;
  background?: BackgroudProps;
  hoverStatus?: BackgroudProps;
  radius?: number | string;
  shadow?: string;
  children: React.ReactNode;
}
