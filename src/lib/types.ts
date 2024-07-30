import { Activity } from "lucide-react";
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
export type VisibilityProps = "visible" | "hidden" | "collapse";
export type BoxSizeProps = "auto" | "full" | "screen" | "min" | "max";
export type PositionProps =
  | "static"
  | "relative"
  | "absolute"
  | "fixed"
  | "sticky";

//-----------------FILTERS----------------

export interface FiltersProps {
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
  translate?: CoordProps;
  scale?: number | string;
  rotate?: number | string;
  skew?: number | string;
  origin?: string | CoordProps;
}

export interface BaliseProps {
  display?: DisplayProps;
  coord?: CoordProps;
  position?: PositionProps;
  opacity?: number | string;
  visibility?: VisibilityProps;
  zIndex?: string | number;
  contentBefore?: React.ReactNode;
  contentAfter?: React.ReactNode;
  cursor?: CursorProps;
  srOnly?: boolean;
  transform?: TransformProps;
}

export interface CoordProps {
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

export interface BorderProps {
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

export interface DividerProps {
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

//-----------------GRADIENT----------------
export interface GradientProps {
  from: string;
  to: string;
  colorStart?: string;
  colorEnd?: string;
  colorMiddle?: string;
  colorStartDeg?: number | string;
  colorEndDeg?: number | string;
  colorMiddleDeg?: number | string;
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

export interface BackgroundProps {
  color?: string;
  image?: string;
  opacity?: number;
  attachment?: "scroll" | "fixed" | "local";
  clip?: "border-box" | "padding-box" | "content-box" | "text";
  origin?: "border-box" | "padding-box" | "content-box";
  gradient?: GradientProps;
  border?: BorderProps;
  ring?: RingProps;
  outline?: OutlineProps;
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
    | CoordProps;
  backgroundRepeat?: "no-repeat" | "repeat" | "repeat-x" | "repeat-y";
  backgroundBlendMode?: BlendModeProps;
  mixBlendMode?: BlendModeProps;
}
//-----------------STATUS----------------
export interface StatusProps {
  hover?: {
    background?: BackgroundProps;
    border?: BorderProps;
    ring?: RingProps;
    shadow?: string;
  };
}

/*-------------------------- TYPOGRAPHY  --------------------------*/

export interface TextProps extends BaliseProps {
  fontFamily?: string | string[];
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
  textAlign?: "left" | "center" | "right" | "justify" | "start" | "end";
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
  stroke?: string;
  strokeWidth?: number;
  type: "font" | "svg" | "img";
}

export interface ImageProps extends BaliseProps {
  src: string;
  alt: string;
  width?: number | string;
  height?: number | string;
  border?: BorderProps;
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
    | CoordProps;
  float?: "start" | "end" | "left" | "right" | "none";
}

//----CONTAINER-----

export interface BoxProps extends BaliseProps {
  balise?:
    | "page"
    | "body"
    | "main"
    | "div"
    | "section"
    | "article"
    | "aside"
    | "header"
    | "footer"
    | "nav"
    | "form"
    | "details"
    | "figure"
    | "summary";
  layout?:
    | "flex-row"
    | "flex-row-reverse"
    | "flex-col"
    | "flex-col-reverse"
    | "grid"
    | "block"
    | "inline"
    | "inline-block";
  position?: PositionProps;
  size?: SizeProps;
  padding?: PaddingProps;
  background?: BackgroundProps;
  hover?: StatusProps;
  divider?: DividerProps;
  children: React.ReactNode;
  arrangement?: ArrangementProps;
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
export type JustifySelfProps = "start" | "end" | "center" | "stretch";
export type PlaceContentProps =
  | "start"
  | "end"
  | "center"
  | "stretch"
  | "space-between"
  | "space-around"
  | "space-evenly"
  | "baseline";

export type PlaceItemsProps =
  | "start"
  | "end"
  | "center"
  | "stretch"
  | "baseline";

export type PlaceSelfProps =
  | "start"
  | "end"
  | "center"
  | "stretch"
  | "baseline";
export interface ArrangementProps {
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
    alignItems?: AlignItemsProps;
    justifyItems?: JustifyItemsProps;
    justifySelf?: JustifySelfProps;
    placeContent?: PlaceContentProps;
    placeItems?: PlaceItemsProps;
    placeSelf?: PlaceSelfProps;
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
    alignItems?: AlignItemsProps;
    justifyItems?: JustifyItemsProps;
    justifySelf?: JustifySelfProps;
    alignSelf?: JustifySelfProps;
    placeContent?: PlaceContentProps;
    placeItems?: PlaceItemsProps;
  };
}

//-----------------FORM----------------
export interface StatusFormProps {
  hover?: {
    text?: TextProps;
    background?: BackgroundProps;
    border?: BorderProps;
    ring?: RingProps;
    shadow?: string;
  };
  disabled?: {
    text?: TextProps;
    background?: BackgroundProps;
    border?: BorderProps;
    ring?: RingProps;
    shadow?: string;
  };
  focus?: {
    text?: TextProps;
    background?: BackgroundProps;
    border?: BorderProps;
    ring?: RingProps;
    shadow?: string;
  };
  error?: {
    text?: TextProps;
    background?: BackgroundProps;
    border?: BorderProps;
    ring?: RingProps;
    shadow?: string;
  };
  valid?: {
    text?: TextProps;
    background?: BackgroundProps;
    border?: BorderProps;
    ring?: RingProps;
    shadow?: string;
  };
}

export interface InputProps extends BaliseProps {
  text?: TextProps;
  background?: BackgroundProps;
  border?: BorderProps;
  ring?: RingProps;
  shadow?: string;
  appearance?: "none" | "auto";
  accept?: string;
  pointerEvents?: "none" | "auto";
  status?: StatusFormProps;
}

export interface InputTextProps extends InputProps {
  carretColor?: string;
  placeholderColor?: string;
}

export interface InputTextAreaProps extends InputProps {
  carretColor?: string;
  placeholderColor?: string;
}

export interface InputSelectProps extends InputProps {
  option?: {
    text?: TextProps;
    background?: BackgroundProps;
    border?: BorderProps;
    ring?: RingProps;
    shadow?: string;
    status?: StatusFormProps;
  };
}

export interface InputStatusSelectableFormProps extends StatusFormProps {
  selected?: {
    text?: TextProps;
    background?: BackgroundProps;
    border?: BorderProps;
    ring?: RingProps;
    shadow?: string;
  };
}

export interface InputRadioProps extends InputProps {
  selected?: boolean;
  status?: InputStatusSelectableFormProps;
}

export interface InputCheckboxProps extends InputProps {
  selected?: boolean;
  status?: InputStatusSelectableFormProps;
}

export interface LabelProps extends BaliseProps {
  textColor?: string;
  opacity?: number;
  gradient?: GradientProps;
  border?: BorderProps;
  ring?: RingProps;
  outline: OutlineProps;
  shadow?: string;
}

export interface StatusButtonProps extends StatusFormProps {
  hover?: {
    label?: TextProps;
    background?: BackgroundProps;
    border?: BorderProps;
    ring?: RingProps;
    shadow?: string;
    width?: number | string;
    height?: number | string;
  };
}

export interface ButtonProps extends BaliseProps {
  label?: TextProps;
  variant?: "primary" | "secondary" | "outline";
  position?: PositionProps;
  width?: number | string;
  height?: number | string;
  maxWidth?: number | string;
  maxHeight?: number | string;
  padding?: PaddingProps;
  background?: BackgroundProps;
  size?: SizeProps;
  icon?: IconProps;
  iconPosition?: "left" | "right" | "top" | "bottom";
  iconSpacing?: number | string;
  children: React.ReactNode;
  onClick?: () => void;
  type?: "button" | "submit" | "reset";
  disabled?: boolean;
  status?: StatusButtonProps;
}
//-----------------THEME----------------

export interface ThemeColorsProps {
  primary?: {
    normal?: string;
    hover?: string;
    active?: string;
  };
  secondary?: {
    normal?: string;
    hover?: string;
    active?: string;
  };
  tertiary?: {
    normal?: string;
    hover?: string;
    active?: string;
  };
  quaternary?: {
    normal?: string;
    hover?: string;
    active?: string;
  };
  quinary?: {
    normal?: string;
    hover?: string;
    active?: string;
  };
  success?: string;
  warning?: string;
  danger?: string;
  error?: string;
  desabled?: string;
  accent?: string;
  info?: string;
  light?: string;
  dark?: string;
  white?: string;
  lightWhite?: string;
  black?: string;
  semiBlack?: string;
  lightBlack?: string;
  gray?: string;
  darkGray?: string;
  lightGray?: string;
  transparent?: string;
}

export interface fontFamilyProps {
  primary?: string;
  secondary?: string;
  tertiary?: string;
  quaternary?: string;
  quinary?: string;
}

export interface BlockThemeProps extends BoxProps {
  TitleColor?: ThemeColorsProps;
  subTitleColor?: ThemeColorsProps;
  mainTextColor?: ThemeColorsProps;
}
export interface ThemeProps {
  body?: {
    fontFamily?: fontFamilyProps;
    fontSize?: number | string;
    fontColor?: ThemeColorsProps;
    background?: BackgroundProps;
  };
  nav?: {
    background?: BackgroundProps;
    menuItems?: {
      fontFamily?: fontFamilyProps;
      fontSize?: number | string;
      color?: ThemeColorsProps;
      status?: {
        hover?: {
          color?: ThemeColorsProps;
          background?: BackgroundProps;
        };
        active?: {
          color?: ThemeColorsProps;
          background?: BackgroundProps;
        };
      };
    };
  };
  block?: {
    Title?: TypographyProps;
    subTitle?: TypographyProps;
    mainText?: TypographyProps;
    primaryBlock?: BlockThemeProps;
    secondaryBlock?: BlockThemeProps;
    tertiaryBlock?: BlockThemeProps;
    quaternaryBlock?: BlockThemeProps;
    quinaryBlock?: BlockThemeProps;
  };
  subBlock?: {
    Title?: TypographyProps;
    subTitle?: TypographyProps;
    mainText?: TypographyProps;
    primarySubBlock?: BlockThemeProps;
    secondarySubBlock?: BlockThemeProps;
    tertiarySubBlock?: BlockThemeProps;
    quaternarySubBlock?: BlockThemeProps;
    quinarySubBlock?: BlockThemeProps;
  };
  input?: InputProps;
  inputText?: InputTextProps;
  inputSelect?: InputSelectProps;
  button?: ButtonProps;
  breakpoints?: {
    xs?: number;
    sm?: number;
    md?: number;
    lg?: number;
    xl?: number;
    xxl?: number;
  };
}

//-----------------TRANSITIONS----------------

export interface TransitionProps {
  property?:
    | "none"
    | "default"
    | "all"
    | "colors"
    | "opacity"
    | "shadow"
    | "transform";
  duration?: number | string;
  timingFunction?: "ease-linear" | "ease-in" | "ease-out" | "ease-in-out";

  delay?: number | string;
}

export interface AnimationProps {
  type?: "none" | "ping" | "spin" | "pulse" | "bounce";
}

//-----------------PROJET----------------
export type DeviceProps =
  | "web"
  | "mobile"
  | "desktop"
  | "tablet"
  | "design"
  | "webapp";

export type ProjetTypeProps =
  | "auction" // Site d'enchères en ligne
  | "betting" // Site de paris
  | "blog"
  | "booking"
  | "charity" // Site pour organisation caritative
  | "community" // Site communautaire
  | "comparison" // Site de comparaison de produits ou services
  | "consulting"
  | "corporate"
  | "crowdfunding" // Site de financement participatif
  | "dashboard"
  | "directory" // Annuaire en ligne
  | "eLearning"
  | "ecommerce"
  | "event"
  | "food-delivery"
  | "forum"
  | "government"
  | "hotel"
  | "job-board" // Site de recherche d'emploi
  | "landing"
  | "marketPlace"
  | "media"
  | "news"
  | "news-aggregator" // Agrégateur de nouvelles
  | "non-profit" // Site d'association à but non lucratif
  | "onePage"
  | "personal"
  | "portfolio"
  | "real-estate"
  | "restaurant"
  | "SaaS" // Site pour une application SaaS
  | "service"
  | "socialNetwork"
  | "streaming-music"
  | "streaming-video"
  | "subscription" // Site d'abonnement
  | "travel-agency"
  | "wiki" // Site de type wiki
  | "other";

export type ActivityDomainProps =
  | "agriculture"
  | "arts"
  | "automotive"
  | "beauty"
  | "biotechnology"
  | "construction"
  | "culture"
  | "education"
  | "energy"
  | "entertainment"
  | "fashion"
  | "finance"
  | "fitness"
  | "food"
  | "gaming"
  | "health"
  | "highTech"
  | "insurance"
  | "law"
  | "manufacturing"
  | "media"
  | "pharmaceutical"
  | "space"
  | "sport"
  | "technology"
  | "telecommunications"
  | "tourism"
  | "transportation"
  | "environment"
  | "other";

export type DesignAspectsProps =
  | "curving"
  | "bands"
  | "angled"
  | "tiles"
  | "other";

export interface PageProps extends BoxProps {
  type: "page";
  index: boolean;
  head: {
    title: string;
    description: string;
    keywords: string[];
  };
  image: string;
  theme?: ThemeProps[];
  role: PageRoleProps;
  blocks: BlockProps[];
}

export interface BlockProps extends BlockThemeProps {
  type: BlockTypeProps;
  children: React.ReactNode;
}

export type BlockModuleProps =
  | "about"
  | "call-to-action"
  | "carousel"
  | "contact"
  | "counter"
  | "cta"
  | "events"
  | "faq"
  | "gallery"
  | "latest-news"
  | "map"
  | "menu"
  | "newsletter"
  | "portfolio"
  | "pricing"
  | "products"
  | "quote"
  | "statistics"
  | "steps"
  | "subscribe"
  | "team"
  | "testimonials"
  | "video"
  | "search"
  | "timeline";

export type BlockTypeProps =
  | "banner"
  | "features"
  | "footer"
  | "hero"
  | "navigation"
  | "services"
  | "social-media"
  | "sponsors"
  | "blank"
  | BlockModuleProps;

export type ModuleProps =
  | "pagination"
  | "drawer"
  | "speed-dial"
  | BlockModuleProps;

export type ComponentProps = {
  native:
    | "typography"
    | "button"
    | "text-field"
    | "input-radio"
    | "input-checkbox"
    | "list"
    | "icon"
    | "image"
    | "video"
    | "music";
  navigation:
    | "breadcrumbs"
    | "tabs"
    | "app-bar"
    | "cascader"
    | "dropdown"
    | "newsletter"
    | "search";

  form:
    | "autocomplete"
    | "button-group"
    | "color-picker"
    | "combobox"
    | "date-picker"
    | "date-time-pickers"
    | "floating-action-button"
    | "input-otp"
    | "mentions"
    | "newsletter"
    | "radio-group"
    | "rating"
    | "slider"
    | "switch"
    | "time-picker"
    | "toggle"
    | "toggle-group"
    | "transfer-list"
    | "tree-select"
    | "upload";

  contentDisplay:
    | "accordion"
    | "avatar"
    | "badge"
    | "calendar"
    | "card"
    | "carousel"
    | "chart"
    | "collapse"
    | "data-grid"
    | "popover"
    | "qr-code"
    | "statistic"
    | "table"
    | "tag"
    | "timeline"
    | "tooltip"
    | "tour"
    | "tree"
    | "typography"
    | "tree-view";

  feedback:
    | "alert"
    | "dialog"
    | "alert-dialog"
    | "backdrop"
    | "dialog"
    | "drawer"
    | "message"
    | "notification"
    | "popconfirm"
    | "progress"
    | "result"
    | "skeleton"
    | "snackbar"
    | "spin"
    | "toast"
    | "tooltip";
  social:
    | "comment"
    | "like"
    | "rating"
    | "share"
    | "social-media"
    | "vote"
    | "follow"
    | "friend-request"
    | "friend-list"
    | "friend-suggestion"
    | "date-post";

  eComerce:
    | "cart"
    | "checkout"
    | "credit-card"
    | "invoice"
    | "payment"
    | "product"
    | "shipping"
    | "wishlist"
    | "addToCart"
    | "price";
  personal: "address" | "contact" | "phone" | "email";
  corporate: "copyright";
};

export type PageRoleProps =
  | "about"
  | "blog"
  | "careers"
  | "case-studies"
  | "contact"
  | "dashboard"
  | "events"
  | "faq"
  | "features"
  | "gallery"
  | "help"
  | "home"
  | "how-it-works"
  | "landing"
  | "legal"
  | "login"
  | "portfolio"
  | "pricing"
  | "privacy-policy"
  | "product"
  | "register"
  | "resources"
  | "reviews"
  | "services"
  | "shop"
  | "sitemap"
  | "terms-of-service"
  | "testimonials"
  | "user-profile"
  | "other";

export interface AppProps {
  title: string;
  description: string;
  mainApp: boolean;
  dateOfCreation: number;
  lastUpdate: number;
  device: DeviceProps;
  image: string;
  theme?: ThemeProps[];
  maxWidth?: number | string;
  designAspects?: DesignAspectsProps;
  tags: string[];
  pages: PageProps[];
}

export interface ProjetProps {
  title: string;
  description: string;
  dateOfCreation: number;
  lastUpdate: number;
  type?: ProjetTypeProps;
  activityDomain?: ActivityDomainProps;
  theme?: ThemeProps[];
  image: string;
  tags: string[];
  apps: AppProps[];
}
