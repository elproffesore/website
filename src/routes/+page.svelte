<script>
 import Project from '$lib/components/Project.svelte';
 let projects = [{year: "2025", projects: ["project-splee","project-textarium","project-studium-planetare"]},
                 {year: "2024", projects: ["project-forever-lost-deutschland","project-generative-syllabus-site"]},
                 {year: "2023", projects: ["project-from-space-to-place","project-dialectics-of-climate-futures"]}];</script>

	<div class="col-start-1 col-span-12 md:col-start-3 md:col-span-8 flex flex-col gap-4">
        {#each Object.keys(projects) as yearIndex}
        <div >
                <h1 class="text-accent sticky top-8 -mb-12 hidden md:block">{projects[yearIndex].year}</h1>
                {#each projects[yearIndex].projects as project}
                    <Project projectName={project} />
                {/each}
        </div>
        {/each}
	</div>
