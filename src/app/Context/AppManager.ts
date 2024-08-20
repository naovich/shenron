import { AppProps } from "@/lib/types";

export const addApp = (projectTitle: string, app: AppProps) => ({
  type: "ADD_APP" as const,
  payload: {
    projectTitle,
    updatedApps: (apps: AppProps[]): AppProps[] => [...apps, app],
  },
});

export const updateApp = (projectTitle: string, updatedApp: AppProps) => ({
  type: "UPDATE_APP" as const,
  payload: {
    projectTitle,
    updatedApps: (apps: AppProps[]): AppProps[] =>
      apps.map((app) => (app.title === updatedApp.title ? updatedApp : app)),
  },
});

export const deleteApp = (projectTitle: string, appTitle: string) => ({
  type: "DELETE_APP" as const,
  payload: {
    projectTitle,
    updatedApps: (apps: AppProps[]): AppProps[] =>
      apps.filter((app) => app.title !== appTitle),
  },
});

export const useAppManagement = (dispatch: React.Dispatch<any>) => {
  return {
    addApp: (projectTitle: string, app: AppProps) =>
      dispatch(addApp(projectTitle, app)),
    updateApp: (projectTitle: string, app: AppProps) =>
      dispatch(updateApp(projectTitle, app)),
    deleteApp: (projectTitle: string, appTitle: string) =>
      dispatch(deleteApp(projectTitle, appTitle)),
  };
};
