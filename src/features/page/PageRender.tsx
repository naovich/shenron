"use client";
import { PageProps, PageRoleProps } from "@/lib/types";
import React from "react";

interface PageRenderProps {
  page: PageProps;
}

function PageRender({ page }: PageRenderProps) {
  return <body>{page.children}</body>;
}

export default PageRender;
