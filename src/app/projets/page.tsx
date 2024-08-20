import React from "react";
import ProjectList from "./ProjectList";
import AddProjet from "./AddProject";
import Link from "next/link";

function Projets() {
  return (
    <div>
      <div>page</div>
      <div>
        <Link href="/">home</Link>
      </div>
      <ProjectList />
      <AddProjet />
    </div>
  );
}

export default Projets;
