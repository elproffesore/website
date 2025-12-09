<script>
	import { LinkHandler } from '$lib/utils/linkhandler.svelte';
	import '../app.css';
	

	let { children } = $props();
</script>

<svelte:head>
	<meta property="og:title" content="Philipp Proff">
    <meta property="og:description" content="This website is the contemporary representation of my works, thoughts and creativity.">
    <meta property="og:url" content="https://philippproff.eu/">
	<title>Thinking ...</title>
</svelte:head>

<div class="grid grid-cols-12 grid-rows-[auto_1fr] gap-4 bg-background min-h-screen w-screen mt-8 md:p-0 px-4">
	<h3 class="small-container">Intro</h3>
	<p class="big-container">
		Hi! My name is Philipp – I'm a designer and creative technologist. I have an M.A. Design &
		Computation (TU Berlin and UdK Berlin) and a B.E. in Media Technologies (Media University
		Stuttgart). My interests include data interfaces, data visualizations, node-based interfaces,
		computational social science, human-computer interaction and the digital humanities. In my free time I enjoy playing table
		tennis, spikeball and reading books.
	</p>
	<h3 class="small-container">Skills</h3>
	<p class="big-container font-sans font-normal">Frontend ⭢ JavaScript, HTML, CSS, Svelte, Vue <br> Backend ⭢ NodeJS (Express), Python (FastAPI) <br> Data+Vis ⭢ JupyterNotebook, Observable, D3.js <br> Tools ⭢ Figma, Touchdesigner, Affinity Designer/Photo </p>
	{@render children()}
</div>

