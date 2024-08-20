import React from "react";
import Link from "next/link";
import ProjectList from "./ProjectList";
import ProjectManager from "./ProjectManager";

function Projets() {
  return (
    <div>
      <div>page</div>
      <div>
        <Link href="/">home</Link>
      </div>
      <ProjectList />
      <ProjectManager />
    </div>
  );
}

export default Projets;
