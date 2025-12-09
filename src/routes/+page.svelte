<script>
 import Project from '$lib/components/Project.svelte';
 let projects = [{year: "2025", projects: ["project-splee","project-textarium", "project-meandering-interpretations","project-studium-planetare"]},
                 {year: "2024", projects: ["project-forever-lost-deutschland","project-from-space-to-place"]},
                 {year: "2023", projects: ["project-generative-syllabus-site","project-dialectics-of-climate-futures"]}];
let collapseChange = $state(false)
</script>

<div id="content" class="container h-full relative">
	<div class="sticky top-0 bg-background z-14 col-span-8 grid-8 items-center pt-6 pb-4">
		<h3 class="col-span-2 md:col-span-1">Projects</h3>
		<button class="col-start-8 justify-self-end w-max btn text-sm" onclick={() => {collapseChange = !collapseChange}}>{collapseChange ? "Expand" : "Collapse"} All</button>
	</div>
	{#each Object.keys(projects) as yearIndex}
		<div class="grid-8 relative">
			<div class="col-span-8">
				{#each projects[yearIndex].projects as project, projectIndex}
					<Project projectName={project} {projectIndex} {collapseChange}/>
				{/each}
			</div>
		</div>
	{/each}
</div>
