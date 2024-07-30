import React from "react";

/*-------------------------- COMMON  --------------------------*/
export type DisplayProps =
  | "block"
  | "inline"
  | "inline-block"
  | "flex"
  | "inline-flex"
  | "grid"
  | "none";
export type visibilityProps = "visible" | "hidden" | "collapse";
export type BoxSizeProps = "auto" | "full" | "screen" | "min" | "max";
export type positionProps =
  | "static"
  | "relative"
  | "absolute"
  | "fixed"
  | "sticky";

export interface BaliseProps {
  display?: DisplayProps;
  position?: positionProps;
  opacity?: number | string;
  visibility?: visibilityProps;
  zIndex?: string | number;
  contentBefore?: React.ReactNode;
  contentAfter?: React.ReactNode;
  cursor?: CursorProps;
  srOnly?: boolean;
}

export interface coordProps {
  x?: number | string;
  y?: number | string;
}

export interface ShadowProps {
  size: number | string;
  color?: string;
  type: "normal" | "inner" | "none";
}

export type CursorProps =
  | "auto"
  | "default"
  | "pointer"
  | "wait"
  | "text"
  | "move"
  | "help"
  | "not-allowed";

//-----BORDER------

export type BorderStyleProps =
  | "solid"
  | "dotted"
  | "dashed"
  | "double"
  | "groove"
  | "ridge"
  | "inset"
  | "outset"
  | "none"
  | "hidden";
export interface RingProps {
  color?: string;
  offsetColor?: string;
  width?: number | string;
  offsetWidth?: string;
  opacity?: number;
  inset?: boolean;
}

export interface OutlineProps {
  color?: string;
  width?: number | string;
  style?: BorderStyleProps;
  offset?: number | string;
}

export interface borderProps {
  color?: string;
  radius?: number | string;
  width?: number | string;
  style?: BorderStyleProps;
  side?:
    | "all"
    | "top"
    | "bottom"
    | "left"
    | "right"
    | "top-bottom"
    | "left-right";
}

export interface dividerProps {
  direction?: "horizontal" | "vertical";
  color?: string;
  width?: number | string;
  style?: BorderStyleProps;
  opacity?: number;
  reverse?: boolean;
}
//-----------------SPACING----------------
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

//-----------------SIZE----------------
export interface SizeProps {
  width?: number | string;
  height?: number | string;
  maxWidth?: number | string;
  maxHeight?: number | string;
  minWidth?: number | string;
  minHeight?: number | string;
  sizeTools?: number | string;
}

//-----------------GRADIANT----------------
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

//-----------------BACKGROUND----------------
export type BlendModeProps =
  | "normal"
  | "multiply"
  | "screen"
  | "overlay"
  | "darken"
  | "lighten"
  | "color-dodge"
  | "color-burn";
export interface BackgroudProps {
  color?: string;
  image?: string;
  opacity?: number;
  attachment?: "scroll" | "fixed" | "local";
  clip?: "border-box" | "padding-box" | "content-box" | "text";
  origin?: "border-box" | "padding-box" | "content-box";
  gradient?: GradiantProps;
  border?: borderProps;
  ring?: RingProps;
  shadow?: string;
  backgroundSize?: "auto" | "cover" | "contain";
  backgroundPosition?:
    | "center"
    | "top"
    | "bottom"
    | "left"
    | "right"
    | "top left"
    | "top right"
    | "bottom left"
    | "bottom right"
    | coordProps;
  backgroundRepeat?: "no-repeat" | "repeat" | "repeat-x" | "repeat-y";
  backgroundBlendMode?: BlendModeProps;
  mixBlendMode?: BlendModeProps;
}
//-----------------STATUS----------------
export interface statusProps {
  hoverStatus?: {
    label?: TextProps;
    background?: BackgroudProps;
    border?: borderProps;
    ring?: RingProps;
    shadow?: string;
  };
  disabledStatus?: {
    label?: TextProps;
    background?: BackgroudProps;
    border?: borderProps;
    ring?: RingProps;
    shadow?: string;
  };
  focusStatus?: {
    label?: TextProps;
    background?: BackgroudProps;
    border?: borderProps;
    ring?: RingProps;
    shadow?: string;
  };
}

/*-------------------------- TYPOGRAPHY  --------------------------*/

export interface TextProps extends BaliseProps {
  fontFamilly?: string | string[];
  color?: string;
  fontSize?: number | string;
  fontStyle?: "normal" | "italic" | "oblique";
  fontSmoothing?: "antialiased" | "subpixel-antialiased" | "none";
  fontWeight?:
    | "thin"
    | "extralight"
    | "light"
    | "normal"
    | "medium"
    | "semibold"
    | "bold"
    | "extrabold"
    | "black";
  fontVariant?: "normal" | "small-caps";
  fontVariantNumeric?:
    | "normal"
    | "ordinal"
    | "slashed-zero"
    | "lining-nums"
    | "oldstyle-nums"
    | "proportional-nums"
    | "tabular-nums"
    | "diagonal-fractions"
    | "stacked-fractions";
  letterSpacing?: number | string;
  lineClamp?: number | "none";
  lineHeight?: number | string;
  textTransform?: "uppercase" | "lowercase" | "capitalize" | "none";
  textAlight?: "left" | "center" | "right" | "justify" | "start" | "end";
  textDecoration?: "underline" | "overline" | "line-through" | "none";
  textDecorationColor?: string;
  textDecorationStyle?: "solid" | "double" | "dotted" | "dashed" | "wavy";
  textDecorationThickness?: number | string;
  textUnderlineOffset?: number | string;
  textOverflow?: "clip" | "ellipsis" | "truncate";
  textWrap?: "wrap" | "nowrap" | "balance" | "pretty";
  textIndent?: number | string;
  wordSpacing?: number | string;
  verticalAlign?:
    | "baseline"
    | "top"
    | "middle"
    | "bottom"
    | "text-top"
    | "text-bottom"
    | "sub"
    | "super";
  clear?: "left" | "right" | "both" | "none";
  whiteSpace?:
    | "normal"
    | "nowrap"
    | "pre"
    | "pre-line"
    | "pre-wrap"
    | "break-spaces";
  wordBreak?: "normal" | "break-all" | "break-word" | "keep-all";
  hyphens?: "none" | "manual" | "auto";
  userSelect?: "none" | "text" | "all" | "auto";
}

export interface TypographyProps extends BaliseProps {
  type?: "h1" | "h2" | "h3" | "h4" | "h5" | "h6" | "p" | "span";
  children: React.ReactNode;
  text: TextProps;
}
export interface List extends BaliseProps {
  type?: "ul" | "ol";
  listImage?: "none" | string;
  listStyleType?: "none" | "disc" | "decimal";
  listStylePosition?: "inside" | "outside";
  children: React.ReactNode;
}

export interface IconProps extends BaliseProps {
  width?: number;
  height?: number;
  color?: string;
  fill?: string;
  stoke?: string;
  stokeWidth?: number;
  type: "font" | "svg" | "img";
}
export interface ButtonProps extends BaliseProps {
  label?: TextProps;
  variant?: "primary" | "secondary" | "outline";
  position?: positionProps;
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

export interface ImageProps extends BaliseProps {
  src: string;
  alt: string;
  width?: number | string;
  height?: number | string;
  border?: borderProps;
  radius?: number;
  shadow?: boolean;
  objectFit?: "fill" | "contain" | "cover" | "none" | "scale-down";
  objectPosition?:
    | "center"
    | "top"
    | "bottom"
    | "left"
    | "right"
    | "top left"
    | "top right"
    | "bottom left"
    | "bottom right"
    | coordProps;
  float?: "start" | "end" | "left" | "right" | "none";
}

//----CONTAINER-----

export interface BoxProps extends BaliseProps {
  type?:
    | "div"
    | "section"
    | "article"
    | "aside"
    | "header"
    | "footer"
    | "nav"
    | "main"
    | "form"
    | "details"
    | "summary";
  layout?: "flex" | "grid" | "block";
  position?: positionProps;
  coord?: coordProps;
  size?: SizeProps;
  padding?: PaddingProps;
  background?: BackgroudProps;
  hoverStatus?: BackgroudProps;
  radius?: number | string;
  shadow?: string;
  divider?: dividerProps;
  children: React.ReactNode;
  arrangement?: arrangementProps;
  overflow?: "visible" | "hidden" | "scroll" | "auto";
  space?: number | string;
}

//-----------------ARRANGEMENT----------------

export type JustifyContentProps =
  | "normal"
  | "start"
  | "end"
  | "center"
  | "space-between"
  | "space-around"
  | "space-evenly"
  | "stretch";

export type AlignContentProps =
  | "normal"
  | "start"
  | "end"
  | "center"
  | "stretch"
  | "space-between"
  | "space-around"
  | "space-evenly"
  | "baseline";
export type AlignItemsProps = "start" | "end" | "center" | "stretch";
export type JustifyItemsProps = "start" | "end" | "center" | "stretch";
export type justifySelfProps = "start" | "end" | "center" | "stretch";
export type placeContentProps =
  | "start"
  | "end"
  | "center"
  | "stretch"
  | "space-between"
  | "space-around"
  | "space-evenly"
  | "baseline";

export type placeItemsProps =
  | "start"
  | "end"
  | "center"
  | "stretch"
  | "baseline";

export type placeSelfProps =
  | "start"
  | "end"
  | "center"
  | "stretch"
  | "baseline";
export interface arrangementProps {
  columns?: number | string;
  container?: boolean;
  flex?: {
    direction?: "row" | "row-reverse" | "column" | "column-reverse";
    gap?: number | string;
    basis?: number | string;
    grow?: number | string;
    shrink?: number | string;
    order?: number | string;
    justifyContent?: JustifyContentProps;
    alignItem?: AlignItemsProps;
    justifyItems?: JustifyItemsProps;
    justifySelf?: justifySelfProps;
    placeContent?: placeContentProps;
    placeItems?: placeItemsProps;
    wrap?: "nowrap" | "wrap" | "wrap-reverse";
    tools?: "flex-1" | "flex-auto" | "flex-initial" | "flex-none";
  };
  grid?: {
    template?: string;
    gap?: number | string;
    column?: number | string;
    colSpan?: number | string;
    row?: string;
    rowSpan?: number | string;
    flow?: "row" | "column" | "row-dense" | "column-dense";
    autoColumns?:
      | "auto-cols-auto"
      | "auto-cols-min"
      | "auto-cols-max"
      | "auto-cols-fr";
    autoRows?:
      | "auto-rows-auto"
      | "auto-rows-min"
      | "auto-rows-max"
      | "auto-rows-fr";
    justifyContent?: JustifyContentProps;
    alignItem?: AlignItemsProps;
    justifyItems?: JustifyItemsProps;
    justifySelf?: justifySelfProps;
    alignSelf?: justifySelfProps;
    placeContent?: placeContentProps;
    placeItems?: placeItemsProps;
  };
}

//-----------------EFFECTS----------------

export interface EffectsProps {
  blur?: number | string;
  brightness?: number | string;
  contrast?: number | string;
  drpShadow?: string;
  grayscale?: number | string;
  hueRotate?: number | string;
  inertia?: number | string;
  saturate?: number | string;
  sepia?: number | string;
  backdropBlur?: number | string;
  backdropBrightness?: number | string;
  backdropContrast?: number | string;
  backdropGrayscale?: number | string;
  backdropHueRotate?: number | string;
  backdropInvert?: number | string;
  backdropOpacity?: number | string;
  backdropSaturate?: number | string;
  backdropSepia?: number | string;
}

//-----------------TANSFORM----------------

export interface TransformProps {
  translate?: coordProps;
  scale?: number | string;
  rotate?: number | string;
  skew?: number | string;
  origin?: string | coordProps;
}

//-----------------FORM----------------

export interface InputProps extends BaliseProps {
  appearance?: "none" | "auto";
  accept?: string;
  carretColor?: string;
  pointerEvents?: "none" | "auto";
}
