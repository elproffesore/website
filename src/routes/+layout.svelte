<script>
	import { LinkHandler } from '$lib/utils/linkhandler.svelte';
	import {MetaTags} from 'svelte-meta-tags';
	import '../app.css';
	

	let { children } = $props();
</script>

<MetaTags
	title="Portfolio of Philipp Proff"
	titleTemplate=""
	description="This website is the contemporary representation of my works, thoughts and creativity."
	openGraph={{
		title: 'Portfolio of Philipp Proff',
		images: [
			{
				url: 'https://philippproff.eu/media/og-preview.webp',
				width: 1280,
				height: 720,
				alt: 'Portfolio header preview'
			}
		]
	}}/>
<div class="grid grid-cols-12 grid-rows-[auto_1fr] gap-4 bg-background min-h-screen w-screen mt-8 md:p-0 px-4">
	<h3 class="small-container text-black uppercase">Intro</h3>
	<p class="big-container">
		Hi – my name is Philipp. I'm a designer and programmer. I have an M.A. in Design &
		Computation (TU Berlin and UdK Berlin) and a B.E. in Media Technologies (Media University
		Stuttgart). My practices and interests span across topics such as data interfaces, data visualizations, node-based interfaces,
		computational social science, human-computer interaction and the digital humanities. In my free time I enjoy playing table
		tennis, spikeball and reading books.
	</p>
	<h3 class="small-container text-black uppercase"></h3>
	<p class="big-container font-sans font-normal mb-8"><b>Frontend</b> ⭢ JavaScript, HTML, CSS, Svelte, Vue <b>Backend</b> ⭢ NodeJS (Express,SvelteKit), Python (FastAPI) <b>Data+Vis</b> ⭢ JupyterNotebook, Observable, D3.js <b>Tools</b> ⭢ Figma, VSCode, Processing, Touchdesigner, Affinity Designer</p>
	<hr class="col-span-12 md:col-start-3 md:col-span-8">
	{@render children()}
</div>

