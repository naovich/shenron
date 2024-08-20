import { AppProps } from "@/lib/types";

export const addApp = (projectId: string, app: AppProps) => ({
  type: "ADD_APP" as const,
  payload: {
    projectId,
    app: { ...app, id: `app-${projectId}-${Date.now().toString()}` },
  },
});

export const updateApp = (projectId: string, app: AppProps) => ({
  type: "UPDATE_APP" as const,
  payload: { projectId, app },
});

export const deleteApp = (projectId: string, appId: string) => ({
  type: "DELETE_APP" as const,
  payload: { projectId, appId },
});

export type AppAction =
  | ReturnType<typeof addApp>
  | ReturnType<typeof updateApp>
  | ReturnType<typeof deleteApp>;
