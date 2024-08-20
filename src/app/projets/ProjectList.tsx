"use client";

import React, { useState } from "react";
import { useProjetState } from "../Context/ProjetContext";
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  CardFooter,
} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { Calendar, Clock, Search } from "lucide-react";

const ProjetList = () => {
  const { state } = useProjetState();
  const [searchTerm, setSearchTerm] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const projectsPerPage = 3; // Réduit à 3 pour une meilleure apparence en colonne unique

  const filteredProjects = state.projets.filter((projet) =>
    projet.title.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const indexOfLastProject = currentPage * projectsPerPage;
  const indexOfFirstProject = indexOfLastProject - projectsPerPage;
  const currentProjects = filteredProjects.slice(
    indexOfFirstProject,
    indexOfLastProject
  );

  const paginate = (pageNumber: number) => setCurrentPage(pageNumber);

  return (
    <div className="p-6 max-w-4xl mx-auto">
      <h1 className="text-3xl font-bold mb-6">Liste des Projets</h1>

      <Card className="mb-8">
        <CardHeader>
          <CardTitle>Rechercher un projet</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="relative">
            <Input
              type="text"
              placeholder="Entrez le nom du projet..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="pl-10"
            />
            <Search
              className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"
              size={20}
            />
          </div>
        </CardContent>
      </Card>

      {currentProjects.map((projet) => (
        <Card
          key={projet.title}
          className="mb-4 hover:shadow-lg transition-shadow duration-300"
        >
          <CardHeader>
            <CardTitle>{projet.title}</CardTitle>
          </CardHeader>
          <CardContent>
            <p className="text-gray-600 mb-4">{projet.description}</p>
            <div className="flex items-center text-sm text-gray-500 mb-2">
              <Calendar className="mr-2" size={16} />
              <span>
                Créé le : {new Date(projet.dateOfCreation).toLocaleDateString()}
              </span>
            </div>
            <div className="flex items-center text-sm text-gray-500">
              <Clock className="mr-2" size={16} />
              <span>
                Mis à jour le :{" "}
                {new Date(projet.lastUpdate).toLocaleDateString()}
              </span>
            </div>
          </CardContent>
        </Card>
      ))}

      {filteredProjects.length > projectsPerPage && (
        <div className="flex justify-center mt-6">
          {Array.from(
            { length: Math.ceil(filteredProjects.length / projectsPerPage) },
            (_, i) => (
              <Button
                key={i}
                onClick={() => paginate(i + 1)}
                variant={currentPage === i + 1 ? "default" : "outline"}
                className="mx-1"
              >
                {i + 1}
              </Button>
            )
          )}
        </div>
      )}
    </div>
  );
};

export default ProjetList;
