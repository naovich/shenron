"use client";

import React, { useRef, useEffect, FC, RefObject } from "react";
import { Button, ButtonProps } from "./button";

const AutoFocusButton = (props: any) => {
  // Spécifiez le type de la ref comme HTMLButtonElement
  const buttonRef: RefObject<HTMLButtonElement> = useRef(null);

  useEffect(() => {
    // Focus automatiquement le bouton lors du montage du composant
    buttonRef.current?.focus();
  }, []);

  return (
    <Button
      {...props}
      ref={buttonRef}
      variant="primary"
      onClick={() => console.log("Button clicked!")}
    >
      {props.children || "Auto-focused Button"}
    </Button>
  );
};
export default AutoFocusButton;
