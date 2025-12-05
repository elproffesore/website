<script>
 import Project from '$lib/components/Project.svelte';
 let projects = ["project-splee", "project-textarium","project-studium-planetare","project-forever-lost-deutschland","project-generative-syllabus-site","project-from-space-to-place","project-dialectics-of-climate-futures"];
</script>

<div class="grid grid-cols-12">
	<p class="col-start-1 col-span-12 md:col-start-5 md:col-span-5 flex flex-col gap-12 mb-16">
		Hi! My name is Philipp – I'm a designer and creative technologist. I have an M.A. Design &
		Computation (TU Berlin and UdK Berlin) and a B.E. in Media Technologies (Media University
		Stuttgart). My interests include data interfaces, data visualizations, node-based interfaces,
		computational social science and the digital humanities. In my free time I enjoy playing table
		tennis, spikeball and reading books.
	</p>
	<div class="col-start-1 col-span-12 md:col-start-4 md:col-span-6 flex flex-col gap-12">

        {#each projects as project}
			<Project projectName={project} />
		{/each}

	</div>

</div>
