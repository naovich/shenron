import { PageProps } from "@/lib/types";

export const addPage = (appId: string, page: PageProps): PageAction => ({
  type: "ADD_PAGE",
  payload: { appId, page },
});

export const updatePage = (appId: string, page: PageProps): PageAction => ({
  type: "UPDATE_PAGE",
  payload: { appId, page },
});

export const deletePage = (appId: string, pageId: string): PageAction => ({
  type: "DELETE_PAGE",
  payload: { appId, pageId },
});

export type PageAction =
  | { type: "ADD_PAGE"; payload: { appId: string; page: PageProps } }
  | { type: "UPDATE_PAGE"; payload: { appId: string; page: PageProps } }
  | { type: "DELETE_PAGE"; payload: { appId: string; pageId: string } };
