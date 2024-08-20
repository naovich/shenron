import { PageProps } from "@/lib/types";
import { PageAction } from "./pageActions";

export const initialPageState: PageState = {
  pages: {},
};

export interface PageState {
  pages: {
    [appId: string]: PageProps[];
  };
}

export const pageReducer = (
  state: PageState,
  action: PageAction
): PageState => {
  switch (action.type) {
    case "ADD_PAGE":
      return {
        ...state,
        pages: {
          ...state.pages,
          [action.payload.appId]: [
            ...(state.pages[action.payload.appId] || []),
            action.payload.page,
          ],
        },
      };
    case "UPDATE_PAGE":
      return {
        ...state,
        pages: {
          ...state.pages,
          [action.payload.appId]: state.pages[action.payload.appId].map(
            (page) =>
              page.id === action.payload.page.id ? action.payload.page : page
          ),
        },
      };
    case "DELETE_PAGE":
      return {
        ...state,
        pages: {
          ...state.pages,
          [action.payload.appId]: state.pages[action.payload.appId].filter(
            (page) => page.id !== action.payload.pageId
          ),
        },
      };
    default:
      return state;
  }
};
