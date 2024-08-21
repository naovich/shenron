import { AppProps, PageProps } from "@/lib/types";

export const addApp = (projectId: string, app: AppProps) => ({
  type: "ADD_APP" as const,
  payload: {
    projectId,
    app: {
      ...app,
      id: `app-${projectId}-${Date.now().toString()}`,
      dateOfCreation: Date.now(),
      lastUpdate: Date.now(),
    },
  },
});

export const updateApp = (projectId: string, app: AppProps) => ({
  type: "UPDATE_APP" as const,
  payload: {
    projectId,
    app: {
      ...app,
      lastUpdate: Date.now(),
    },
  },
});

export const deleteApp = (projectId: string, appId: string) => ({
  type: "DELETE_APP" as const,
  payload: { projectId, appId },
});

export const addPageToApp = (
  projectId: string,
  appId: string,
  page: PageProps
) => ({
  type: "ADD_PAGE_TO_APP" as const,
  payload: {
    projectId,
    appId,
    page: {
      ...page,
      id: `page-${appId}-${Date.now().toString()}`,
    },
  },
});

export const updatePageInApp = (
  projectId: string,
  appId: string,
  page: PageProps
) => ({
  type: "UPDATE_PAGE_IN_APP" as const,
  payload: { projectId, appId, page },
});

export const deletePageFromApp = (
  projectId: string,
  appId: string,
  pageId: string
) => ({
  type: "DELETE_PAGE_FROM_APP" as const,
  payload: { projectId, appId, pageId },
});

export const selectApp = (projectId: string, appId: string) => ({
  type: "SELECT_APP" as const,
  payload: { projectId, appId },
});

export type AppAction =
  | ReturnType<typeof addApp>
  | ReturnType<typeof updateApp>
  | ReturnType<typeof deleteApp>
  | ReturnType<typeof addPageToApp>
  | ReturnType<typeof updatePageInApp>
  | ReturnType<typeof deletePageFromApp>
  | ReturnType<typeof selectApp>;
