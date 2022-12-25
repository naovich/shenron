import Link from "next/link";
import React from "react";

export interface menuItems {
  listMenuItems: {
    label: string;
    href?: string;
    onClick?: () => void;
    style?: {};
  }[];
  style?: {};
}

interface menuType {
  menuItems: menuItems;
  style?: {};
}

export default function Menu({ menuItems, style }: menuType) {
  const menuList = menuItems.listMenuItems.map((item, index) => (
    <li
      onClick={item.onClick}
      style={{ ...defaultLiStyle, ...item.style }}
      key={index}
    >
      <Link href={item.href || "#"}>{item.label}</Link>
    </li>
  ));

  return (
    <div style={{ ...defaultDivStyle, ...style }}>
      <ul style={{ ...defaultUlStyle, ...menuItems.style }}>{menuList}</ul>
    </div>
  );
}

const defaultDivStyle = {
  width: "100%",
  border: "solid 1px grey",
};

const defaultUlStyle = {
  listStyleType: "none",
};

const defaultLiStyle = {
  display: "inline-block",
  margin: "0.5rem",
  padding: "0.5rem",
};
